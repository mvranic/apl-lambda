res←toLambdaErr err;errorname;message;stack
⍝ Returns json string with the Lambda error.
 errorname message stack←err
 nsref←⎕NS''
 nsref.ErrorType←errorname
 nsref.ErrorMessage←message
 nsref.EtackTrace←2↓⊃,/(⊂'\n'),¨stack
 nsref.Resolved←1
 res←⎕JSON nsref


