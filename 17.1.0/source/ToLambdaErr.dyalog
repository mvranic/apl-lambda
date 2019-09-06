errns←toLambdaErr err;errorname;message;stack;errns
⍝ Returns namesapce with the Lambda error.
 logInfo 'toLambdaErr err' err
 logInfo 'toLambdaErr ⍴err'(⍴err)
 
 errorname message stack←err
 errns←⎕NS''
 errns.errorType←errorname
 errns.errorMessage←message
 errns.stackTrace←⊃,/(⊂'\n'),¨stack
 errns.Resolved←0