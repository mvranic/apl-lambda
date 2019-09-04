processEvents handler;context;event;next;result;err;descrition;en;stack;sink;errns
 count←0
 :While 1
    count+←1
    logInfo 'processEvents' count
    event context←awaitTask asyncTask 'nextInvocation' ⍬
    :Trap 0
       logInfo 'Handler is going to be executed:' handler
       result←awaitTask asyncTask'callHandler'(handler(event context))
       logInfo 'Handler is executed:' handler
       errns←result.Err
       :if 9≠⎕NC 'result.Err'
           sink←awaitTask asyncTask'invokeResponse'(result.Result context)
        :else 
           errns.InvocationErr←'Execution'
           err←⎕JSON errns
           sink←awaitTask asyncTask'invokeError'(err context)
           :Continue
       :endif
    :Else
       en←⎕DMX.EN
       descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
       stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
       errns←toLambdaErr  en descrition stack  
       errns.InvocationErr←'Invocation'
       err←⎕JSON errns
       sink←awaitTask asyncTask'invokeError'(err context)
       :Continue
    :EndTrap
 :EndWhile