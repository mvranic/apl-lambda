res←aplHandler arg;event;context;deadline
  ⎕←'Hi from APL on AWS Lambda1!'
  event context←arg
  ⎕←'Hi from APL on AWS Lambda!'
  deadline←⍎⊃context.deadlineMs
  myFn ⍝ Call to another function from MyLib.dws
  ⎕←'There is '(#.getRemainingTimeInMillis deadline ⎕TS)' ms remaining.'
  res←event