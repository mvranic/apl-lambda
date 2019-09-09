 req←postError arg;err;path;options;headers;body;msg;lambdaerr;_enlist;json;lx
 path err←arg
 json←⎕JSON err
 logError 'Error to be POST-ed:' path json
 lx←256>⎕UCS json
 lambdaerr←⎕NS ''
 lambdaerr.Data←lx/json

 ⍝ lambdaerr.Data←'UTF-8' ⎕UCS 'UTF-8' ⎕UCS ⎕JSON err
 method←'POST'
 headers←0 2⍴''
 headers⍪←'Content-Type' 'application/json; charset=utf-8'
 headers⍪←'Lambda-Runtime-Function-Error-Type' (,⍕err.errorType)
 body←⎕JSON lambdaerr
 req←awaitTask requestCreate( method path headers body)
 _enlist←{
     ⎕ML←1
     ∊⍵}

 :If req.HttpStatus≢202
    msg←'Unexpected ',path,' response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',(_enlist req.HttpMessage)
    logHttpRequestErr path req
    msg ⎕SIGNAL  enCUSTOM  
 :EndIf   
