 req←postError arg;err;path;options;headers;body;msg;lambdaerr
 path err←arg
 lambdaerr←toLambdaErr err
 method←'POST'
 headers←0 2⍴''
 headers⍪←'Content-Type' 'application/json'
 headers⍪←'Lambda-Runtime-Function-Error-Type' (⍕lambdaerr.ErrorType)
 body←⎕JSON lambdaerr
 req←awaitMe asyncTask'request'(path method headers body)
 :If req.StstusCode≠202
    msg←'Unexpected ',path,' response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',req.HttpMessage
    logHttpRequestErr path req
    msg ⎕SIGNAL #.enCUSTOM  
 :EndIf   
