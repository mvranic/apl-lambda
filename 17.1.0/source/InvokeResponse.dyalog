 res←invokeResponse arg;context;result;method;url;body;headers;req;msg
 result context←arg
 method←'POST'
 url← RUNTIME_PATH,'/invocation/',context.awsRequestId,'/response'
 :If 0≠⊃⍴result
     body←⎕JSON result
 :Else
     body←⍬
 :EndIf
 headers←⍬
 req←awaitTask requestCreate(method url headers body)

 :If req.HttpStatus≠202
     msg←'Unexpected ',url,' /invocation/response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',req.HttpMessage
     logHttpRequestErr url req
     msg ⎕SIGNAL  enCUSTOM
 :EndIf
  
res←0
