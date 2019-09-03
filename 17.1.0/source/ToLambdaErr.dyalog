errns←toLambdaErr err;errorname;message;stack;errns
⍝ Returns namesapce with the Lambda error.
 errorname message stack←err
 errns←⎕NS''
 errns.errorType←errorname
 errns.errorMessage←message
 errns.stackTrace←2↓⊃,/(⊂'\n'),¨stack
 errns.Resolved←0