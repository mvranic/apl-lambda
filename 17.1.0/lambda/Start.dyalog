start;handler;descrition;en;stack;err
 :Trap 0
    handler←getHandler
 :Else
    en←⎕DMX.EN
    descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
    stack←1 0↓↑⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
    err←en descrition stack
    initError err
    ⎕OFF 1
 :EndTrap
 tryProcessEvents handler
