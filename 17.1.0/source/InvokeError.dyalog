 res←invokeError arg;context;err;url
⍝ Argument context must be namesapce with context arguments.
 err context←arg
 logInfo'invokeError: '
 logInfo'context: '(context)
 logInfo'context json: '(⎕JSON context)
 logInfo'context.awsRequestId: '(context.awsRequestId)
 logInfo'⎕DR context.awsRequestId: '(⎕DR context.awsRequestId)
 logInfo'⎕NC context.awsRequestId: '(⎕NC 'context.awsRequestId')
 logInfo'⍴context.awsRequestId: '(⍴context.awsRequestId)
 logInfo'⍕context.awsRequestId: '(⍕context.awsRequestId)
 logInfo'≡context.awsRequestId: '(≡context.awsRequestId)
 url←#.RUNTIME_PATH,'/invocation/',context.awsRequestId,'/error'
 logInfo'invokeError:'
 logInfo'url' url
 logInfo'err' err
 res←postError url err
