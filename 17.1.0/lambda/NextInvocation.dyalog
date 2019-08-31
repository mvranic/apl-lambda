 res←nextInvocation;req;deadlinems;context;event;_days;method;headers;data;url

 method url headers data←'GET'(#.RUNTIME_PATH,'/invocation/next')⍬ ⍬
 req←awaitTask request method url headers data

 :If req.HttpStatus≠200
    ('Unexpected /invocation/next response HttpStatus=',(⍕req.HttpStatus)' Url=',url))⎕SIGNAL enCUSTOM
 :EndIf
 context←⎕NS''
 :If (⊂'lambda-runtime-trace-id')∊req.Headers[;1]
    #._X_AMZN_TRACE_ID←req.headers[req.Headers[;1]⍳⊂'lambda-runtime-trace-id';] ⍝ Todo: Set to env
 :Else
    ⎕EX'#._X_AMZN_TRACE_ID' ⍝ Todo: Delete to env
 :EndIf

 deadlinems←req.headers[req.Headers[;1]⍳⊂'lambda-runtime-deadline-ms';]
 context.awsRequestId←req.headers[req.Headers[;1]⍳⊂'lambda-runtime-aws-request-id';]
 context.invokedFunctionArn←req.headers[req.Headers[;1]⍳⊂'lambda-runtime-invoked-function-arn';]
 context.logGroupName←#.AWS_LAMBDA_LOG_GROUP_NAME
 context.logStreamName←#.AWS_LAMBDA_LOG_STREAM_NAME
 context.functionName←#.AWS_LAMBDA_FUNCTION_NAME
 context.functionVersion←#.AWS_LAMBDA_FUNCTION_VERSION,
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
 context.getRemainingTimeInMillis←deadlineMs-1000×86400∘×∘(-∘25568)∘days ⎕TS
 context.callbackWaitsForEmptyEventLoop←1

 :If (⊂'lambda-runtime-client-context')∊req.Headers[;1]
    context.clientContext←⎕JSON req.headers[req.Headers[;1]⍳⊂'lambda-runtime-client-context';] ⍝ Todo: Set to env
 :EndIf

 :If (⊂'lambda-runtime-cognito-identity')∊req.Headers[;1]
    context.identity←⎕JSON req.headers[req.Headers[;1]⍳⊂'lambda-runtime-cognito-identity';] ⍝ Todo: Set to env
 :EndIf

 event←⎕JSON req.body

 res←event context
