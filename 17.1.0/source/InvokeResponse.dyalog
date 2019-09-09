 res←invokeResponse arg;context;result;method;url;body;headers;req;msg
 result context←arg
 logInfo 'invokeResponse' result context
 method←'POST'
 url← RUNTIME_PATH,'/invocation/',context.awsRequestId,'/response'
 :If 0≠⊃⍴result
     body←'UTF-8'⎕UCS'UTF-8'⎕UCS ⎕JSON result
 :Else
     body←⍬
 :EndIf
 headers←0 2⍴'' 
 headers⍪←'Content-Type' 'application/json; charset=utf-8'
 req←awaitTask requestCreate(method url headers body)

 :If req.HttpStatus≠202
     msg←'Unexpected ',url,' /invocation/response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',req.HttpMessage
     logHttpRequestErr url req
     msg ⎕SIGNAL  enCUSTOM
 :EndIf
  
res←0
