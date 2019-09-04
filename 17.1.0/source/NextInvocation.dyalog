 res←nextInvocation arg;req;deadlinems;context;event;_days;method;headers;data;url;headres;sink;ns
 sink←arg ⍝ Not used.
 method url headers data←'GET'(#.RUNTIME_PATH,'/invocation/next')⍬ ⍬
 ⍝logInfo 'Next invocation from:' method url headers data
 logInfo 'Next invocation from:' method url
 req←awaitTask requestCreate method url headers data

 :If req.HttpStatus≠200
    msg←'Unexpected /invocation/next response HttpStatus=',(⍕req.HttpStatus),' Url=',url
    msg ⎕SIGNAL enCUSTOM
 :EndIf
 
 :If 1=≡⍴req.Headers
 :Andif 3=≡req.Headers
    headres←⊃req.Headers
  :Else
    headres←req.Headers       
 :EndIf
 headres[;1]←_lowcase¨headres[;1]

 context←⎕NS''
 :If (⊂'lambda-runtime-trace-id')∊headres[;1]
    #._X_AMZN_TRACE_ID←headres[headres[;1]⍳⊂'lambda-runtime-trace-id';2] ⍝ Todo: Set to env
 :Else
    ⎕EX'#._X_AMZN_TRACE_ID' ⍝ Todo: Delete to env
 :EndIf

 deadlinems←headres[headres[;1]⍳⊂'lambda-runtime-deadline-ms';2]
 context.awsRequestId←headres[headres[;1]⍳⊂'lambda-runtime-aws-request-id';2]
 :If 2=⎕NC 'context.awsRequestId'
    context.awsRequestId←(⍕context.awsRequestId)~' '
 :EndIf
 
 context.invokedFunctionArn←headres[headres[;1]⍳⊂'lambda-runtime-invoked-function-arn';2]
 context.deadlineMs←deadlinems
 context.logGroupName←#.AWS_LAMBDA_LOG_GROUP_NAME
 context.logStreamName←#.AWS_LAMBDA_LOG_STREAM_NAME
 context.functionName←#.AWS_LAMBDA_FUNCTION_NAME
 context.functionVersion←#.AWS_LAMBDA_FUNCTION_VERSION
 context.memoryLimitInMB←#.AWS_LAMBDA_FUNCTION_MEMORY_SIZE
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

 :If (⊂'lambda-runtime-client-context')∊headres[;1]
    context.clientContext←⎕JSON headres[headres[;1]⍳⊂'lambda-runtime-client-context';2] ⍝ Todo: Set to env
 :EndIf

 :If (⊂'lambda-runtime-cognito-identity')∊headres[;1]
    context.identity←⎕JSON headres[headres[;1]⍳⊂'lambda-runtime-cognito-identity';2] ⍝ Todo: Set to env
 :EndIf

 event←⎕JSON req.Data
 
 res←event context
