res←toLambdaErr err;errorname;message;stack
⍝ Returns json string with the Lambda error.
 errorname message stack←err
 nsref←⎕NS''
 nsref.errorType←errorname
 nsref.errorMessage←message
 nsref.stackTrace←2↓⊃,/(⊂'\n'),¨stack
 res←⎕JSON nsref


