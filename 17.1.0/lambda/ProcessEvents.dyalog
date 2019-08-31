processEvents handler;context;event;next;result;err;descrition;en;stack;sink
 :While 1
    next←awaitMe nextInvocation
    event←next.Value.event
    context←next.Value.context
    :Trap 0
       result←awaitTask'callHandler'(event context)
       err←result.Err
       :if 0=⊃⍴result.Err 
           invokeResponse result
       :else 
           err.InvocationErr←'Execution'
           sink←awaitTask asyncTask'invokeError'(err context)
           :Continue
       :endif
    :Else
       en←⎕DMX.EN
       descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
       stack←1 0↓↑⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
       err←toLambdaErr  en descrition stack  
       err.InvocationErr←'Invocation'
       sink←awaitTask asyncTask'invokeError'(err context)
       :Continue
    :EndTrap
 :EndWhile