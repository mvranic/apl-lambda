errns←toLambdaErr err;errorname;message;stack;errns
⍝ Returns namesapce with the Lambda error.
 errorname message stack←err
 errns←⎕NS''
 errns.ErrorType←errorname
 errns.ErrorMessage←message
 errns.EtackTrace←2↓⊃,/(⊂'\n'),¨stack
 errns.Resolved←0