lambdaresult←callHandler_Do arg;const;handler;appparts;handlername;modulepath;userhandler;fns;reject;resolve;context;err;result;event;en;descrition;stack
 handler (event context)←arg

 lambdaresult←⎕NS''
 lambdaresult.Result←⍬
 lambdaresult.Err←⍬
 :Trap 0
     result←⍎handler,'(event context)'
     lambdaresult.Result←result
 :Else
     :Trap 0
         en←⎕DMX.EN
         descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
         stack←1 0↓↑⎕SI,¨'[',¨(⍕¨⎕LC),¨']'

         err←toLambdaErr en descrition stack
     :Else
         err←⎕NS''
         err.Resolved←0
     :EndTrap
     lambdaresult.Err←err
 :EndTrap