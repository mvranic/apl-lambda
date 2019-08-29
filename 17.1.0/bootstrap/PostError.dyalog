
 req←postError arg;err;path;options;headers;body;msg;lambdaerr
 path err←arg
 lambdaerr←toLambdaErr err
 options←⎕NS''
 options.method←'POST'
 headers←'''Content-Type'': ''application/json'',''Lambda-Runtime-Function-Error-Type'': ',lambdaerr.errorType,''''
 body←⎕JSON lambdaerr
 req←awaitMe promiseMe'request'(path options headers body)
 :If req.StstusCode≠202
    msg←⊃,/'Unexpected '#.PATH,' response: '(⎕JSON req.res)
    msg ⎕SIGNAL #.enCUSTOM   ⍝ This might not work as a "promise"
 :EndIf   
