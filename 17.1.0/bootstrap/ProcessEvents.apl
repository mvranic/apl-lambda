 processEvents handler;context;event;next;result;err;descrition;en;stack;sink
 :While 1
    next←awaitMe nextInvocation
    event←next.Value.event
    context←next.Value.context
    :Trap 0
       result←awaitMe'callHandler'(event context)
    :Else
       en←⎕DMX.EN
       descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
       stack←1 0↓↑⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
       err←en descrition stack
       sink←awaitMe promiseMe'invokeError'(err context)
       :Continue
    :EndTrap
 :EndWhile