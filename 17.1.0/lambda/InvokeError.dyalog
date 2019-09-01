 res←invokeError arg;context;err
⍝ Argument context must be namesapce with context arguments.
 errns context←arg
 err←⎕JSON errns
 res←postError(RUNTIME_PATH'/invocation/'(⍕context.awsRequestId)'/error')err
