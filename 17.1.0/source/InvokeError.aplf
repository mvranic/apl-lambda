 res←invokeError arg;context;err;url
⍝ Argument context must be namesapce with context arguments.
 err context←arg
 url← RUNTIME_PATH,'/invocation/',context.awsRequestId,'/error'
 res←postError url err
