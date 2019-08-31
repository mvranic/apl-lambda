 res←invokeResponse arg;context;result;method;url;body;headers;req;msg
 result context←arg
 method←'POST'
 url←#.RUNTIME_PATH,'/invocation/',awsRequestId,'/response'
 :If 0≠⊃⍴result
     body←⎕JSON result
 :Else
     body←⍬
 :EndIf
 headers←⍬
 req←awaitTask asyncTask'request'(method url headers body)

 :If req.StstusCode≠202
     msg←'Unexpected ',url,' /invocation/response HttpStatus: ',(⍕req.HttpStatus),' ,HttpMessage: ',req.HttpMessage
     logHttpRequestErr url req
     msg ⎕SIGNAL #.enCUSTOM
 :EndIf
  
res←0
