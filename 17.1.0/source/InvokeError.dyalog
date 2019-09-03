 res←invokeError arg;context;err
⍝ Argument context must be namesapce with context arguments.
 err context←arg
 res←postError(RUNTIME_PATH,'/invocation/,'(⍕context.awsRequestId),'/error')err
