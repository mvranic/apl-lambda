res←aplHandler arg;event;context;deadline
  event context←arg
  ⎕←'Hi from APL (handler) on AWS Lambda!'
  deadline←⍎⊃context.deadlineMs
  myFn ⍝ Call to another function from MyLib.dws
  ⎕←'There is '(#.AplLambdaNsName.getRemainingTimeInMillis deadline ⎕TS)' ms remaining.'
  res←event