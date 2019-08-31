lambdaresult←callHandler_Do arg;const;appparts;handlername;modulepath;userhandler;fns;reject;resolve;context;err;result;event;en;descrition;stack
 event context←arg

 lambdaresult←⎕NS''
 lambdaresult.result←⍬
 lambdaresult.err←⍬
 :Trap 0
     result←⍎'userhandler'(event context)
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
     lambdaresult.err←err
 :EndTrap