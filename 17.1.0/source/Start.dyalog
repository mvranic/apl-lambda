start;handler;descrition;en;stack;err
⍝ bootstarper.daylog has to be run before.
 :Trap 0
    handler←getHandler
 :Else
    en←⎕DMX.EN
    descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
    stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
    err←en descrition stack
    sink←initError err
    ⎕OFF 1
 :EndTrap
 tryProcessEvents handler
