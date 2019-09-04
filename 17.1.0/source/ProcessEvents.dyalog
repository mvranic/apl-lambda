processEvents handler;context;event;next;result;err;descrition;en;stack;sink;errns;next
 count←0
 :While 1
    count+←1
    logInfo 'processEvents' count
    next←awaitTask asyncTask 'nextInvocation' ⍬
    logInfo 'next' next
    event context←next
    logInfo 'event:' event 
    logInfo 'context:' context
    :Trap 0
       result←awaitTask asyncTask'callHandler'(handler(event context))
       logInfo 'Handler is executed:' handler
       errns←result.Err
       :if 9≠⎕NC 'result.Err'
           logInfo 'Try to invoke invokeResponse' 
           sink←awaitTask asyncTask'invokeResponse'(result.Result context)
           logInfo 'Invoked invokeResponse' 
        :else 
           logInfo 'Try to invoke invokeError request' 
           errns.InvocationErr←'Execution'
           err←⎕JSON errns
           sink←awaitTask asyncTask'invokeError'(err context)
           logInfo 'Invoked invokeError request' 
           :Continue
       :endif
    :Else
       logInfo 'Error on call handler'  handler
       en←⎕DMX.EN
       descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
       stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
       errns←toLambdaErr  en descrition stack  
       errns.InvocationErr←'Invocation'
       err←⎕JSON errns
       logInfo 'Try to invoke invokeError request' 
       sink←awaitTask asyncTask'invokeError'(err context)
       :Continue
    :EndTrap
 :EndWhile