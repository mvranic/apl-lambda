 tryProcessEvents handler;en;descrition;stack;err
 :Trap 0
     processEvents handler
 :Else
     ⎕←'Error on process events.'
     :Trap 0
         en←⎕DMX.EN
         descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
         stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
         err←toLambdaErr en descrition stack
         logErrNs err
     :EndTrap
     ⎕OFF 1
 :EndTrap