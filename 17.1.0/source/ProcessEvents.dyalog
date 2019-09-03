processEvents handler;context;event;next;result;err;descrition;en;stack;sink;errns
 :While 1
    next←awaitTask nextInvocation
    event←next.Value.event
    context←next.Value.context
    :Trap 0
       result←awaitTask'callHandler'(event context)
       errns←result.Err
       :if 9≠⎕NC 'result.Err'
           sink←awaitTask'invokeResponse'(result context)
       :else 
           errns.InvocationErr←'Execution'
           err←⎕JSON errns
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