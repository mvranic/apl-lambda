res←toLambdaErr err;errorname;message;stack;errns
⍝ Returns json string with the Lambda error.
 errorname message stack←err
 errns←⎕NS''
 errns.ErrorType←errorname
 errns.ErrorMessage←message
 errns.EtackTrace←2↓⊃,/(⊂'\n'),¨stack
 errns.Resolved←0
 res←⎕JSON errns


