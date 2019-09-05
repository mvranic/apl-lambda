res←myFn arg;event;context;deadline
  event context←arg
  ⎕←'Hi from APL on AWS Lambda!'
  deadline←⍎⊃context.deadlineMs
  ⎕←'There is '(#.getRemainingTimeInMillis deadline ⎕TS)' ms remaining.'
  res←event