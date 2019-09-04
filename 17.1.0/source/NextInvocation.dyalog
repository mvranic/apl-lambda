 res←nextInvocation arg;req;deadlinems;context;event;_days;method;headers;data;url;headres;sink;ns
 sink←arg ⍝ Not used.
 method url headers data←'GET'(#.RUNTIME_PATH,'/invocation/next')⍬ ⍬
 logInfo 'Next invocation from:' method url headers data
 req←awaitTask requestCreate method url headers data

 logInfo 'Next invocation requests: HttpStatus:' req.HttpStatus
 logInfo 'Next invocation requests: HttpMessage:' req.HttpMessage
 :If req.HttpStatus≠200
    msg←'Unexpected /invocation/next response HttpStatus=',(⍕req.HttpStatus),' Url=',url
    msg ⎕SIGNAL enCUSTOM
 :EndIf
 logInfo 'Next invocation requests: Headers:' req.Headers
 
 logInfo 'Next invocation requests: ≡Headers:' (≡req.Headers)
 logInfo 'Next invocation requests: ⍴Headers:' (⍴req.Headers)
 logInfo 'Next invocation requests: ⎕DRHeaders:' (⎕DR req.Headers)

 logInfo 'Next invocation requests: ⊃Headers:' (⊃req.Headers)

 :If 1=≡⍴req.Headers
 :Andif 3=≡req.Headers
    headres←⊃req.Headers
  :Else
    headres←req.Headers       
 :EndIf
 headres[;1]←_lowcase¨headres[;1]

 logInfo 'Next invocation requests: headres:' headres
 
 logInfo 'Next invocation requests: ≡headres:' (≡headres)
 logInfo 'Next invocation requests: ⍴headres:' (⍴headres)
 logInfo 'Next invocation requests: ⎕DR headres:' (⎕DR headres)

 logInfo 'Next invocation requests: ⊃headres:' (⊃headres)

 logInfo 'Next invocation requests: Body:' req.Data

 context←⎕NS''
 :If (⊂'lambda-runtime-trace-id')∊headres[;1]
    #._X_AMZN_TRACE_ID←headres[headres[;1]⍳⊂'lambda-runtime-trace-id';2] ⍝ Todo: Set to env
 :Else
    ⎕EX'#._X_AMZN_TRACE_ID' ⍝ Todo: Delete to env
 :EndIf
 counter←0
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 deadlinems←headres[headres[;1]⍳⊂'lambda-runtime-deadline-ms';2]
 context.awsRequestId←headres[headres[;1]⍳⊂'lambda-runtime-aws-request-id';2]
 :If 2=⎕NC 'context.awsRequestId'
    logInfo 'context.awsRequestId json'(⎕JSON context.awsRequestId)
 :EndIf
 logInfo'context.awsRequestId: '(context.awsRequestId)
 logInfo'⎕DR context.awsRequestId: '(⎕DR context.awsRequestId)
 logInfo'⎕NC context.awsRequestId: '(⎕NC ⊂'context.awsRequestId')
 logInfo'⍴context.awsRequestId: '(⍴context.awsRequestId)
 logInfo'⍕context.awsRequestId: '(⍕context.awsRequestId)
 logInfo'≡context.awsRequestId: '(≡context.awsRequestId)
 :If 2=⎕NC 'context.awsRequestId'
    context.awsRequestId←(⍕context.awsRequestId)~' '
 :EndIf
 logInfo'context.awsRequestId: '(context.awsRequestId)
 logInfo'⎕DR context.awsRequestId: '(⎕DR context.awsRequestId)
 logInfo'⎕NC context.awsRequestId: '(⎕NC ⊂'context.awsRequestId')
 logInfo'⍴context.awsRequestId: '(⍴context.awsRequestId)
 logInfo'⍕context.awsRequestId: '(⍕context.awsRequestId)
 logInfo'≡context.awsRequestId: '(≡context.awsRequestId)
 
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.invokedFunctionArn←headres[headres[;1]⍳⊂'lambda-runtime-invoked-function-arn';2]
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.deadlineMs←deadlinems
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.logGroupName←#.AWS_LAMBDA_LOG_GROUP_NAME
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.logStreamName←#.AWS_LAMBDA_LOG_STREAM_NAME
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.functionName←#.AWS_LAMBDA_FUNCTION_NAME
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.functionVersion←#.AWS_LAMBDA_FUNCTION_VERSION
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 context.memoryLimitInMB←#.AWS_LAMBDA_FUNCTION_MEMORY_SIZE
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)
 _days←{                                      ⍝ Days since 1899-12-31 (Meeus).
    ⍺←17520902                              ⍝ start of Gregorian calendar.
    yy mm dd h m s ms←7↑⊂[⍳¯1+⍴⍴⍵]⍵         ⍝ ⎕ts-style 7-item date-time.
    D←dd+(0 60 60 1000⊥↑h m s ms)÷86400000  ⍝ day with fractional part.
    Y M←yy mm+¯1 12×⊂mm≤2                   ⍝ Jan, Feb → month 13 14.
    A←⌊Y÷100                                ⍝ century number.
    B←(⍺<0 100 100⊥↑yy mm dd)×(2-A)+⌊A÷4    ⍝ Gregorian calendar correction.
    ¯2416544+D+B+⊃+/⌊365.25 30.6×Y M+4716 1 ⍝ (fractional) days.
 }
 context.callbackWaitsForEmptyEventLoop←1
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)

 :If (⊂'lambda-runtime-client-context')∊headres[;1]
    context.clientContext←⎕JSON headres[headres[;1]⍳⊂'lambda-runtime-client-context';2] ⍝ Todo: Set to env
 :EndIf
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)

 :If (⊂'lambda-runtime-cognito-identity')∊headres[;1]
    context.identity←⎕JSON headres[headres[;1]⍳⊂'lambda-runtime-cognito-identity';2] ⍝ Todo: Set to env
 :EndIf
 counter+←1
 logInfo counter'⎕JSON context'(⎕JSON context)

 event←⎕JSON req.Data
 logInfo 'event:' event 
 logInfo 'context:' context
⍝ logInfo ' context as Json:' ⎕JSON context 
 
 res←event context
