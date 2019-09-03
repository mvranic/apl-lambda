 req←postError arg;err;path;options;headers;body;msg;lambdaerr;_enlist
 path err←arg
 lambdaerr←toLambdaErr err
 method←'POST'
 headers←0 2⍴''
 headers⍪←'Content-Type' 'application/json'
 headers⍪←'Lambda-Runtime-Function-Error-Type' (⍕lambdaerr.errorType)
 body←⎕JSON lambdaerr
 req←awaitTask requestCreate(path method headers body)
 _enlist←{
     ⎕ML←1
     ∊⍵}

 :If req.HttpStatus≠202
    msg←'Unexpected ',path,' response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',(_enlist req.HttpMessage)
    logHttpRequestErr path req
    msg ⎕SIGNAL #.enCUSTOM  
 :EndIf   
