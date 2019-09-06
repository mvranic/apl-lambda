lambdaresult←callHandler arg;const;handler;appparts;handlername;modulepath;userhandler;fns;reject;resolve;context;errns;result;event;en;descrition;stack;state
 handlername (event context)←arg

 logInfo 'callHandler handler:' handlername
⍝ logInfo 'event:' event
⍝ logInfo 'context:' context

 lambdaresult←⎕NS''
 lambdaresult.Result←⍬
 lambdaresult.Err←⍬

 :Trap 0
     result←⍎handlername,'(event context)'
     lambdaresult.Result←result
     state←'OK' 
 :Else
     state←'Error' 
     :Trap 0
         en←⎕DMX.EN
         descrition←2↓⊃,/(⊂'\n'),¨(⎕DMX.DM),(⊂⎕DMX.Message)
         stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
         errns←toLambdaErr en descrition stack
         errns.Resolved←1
     :Else
         errns←⎕NS''
         errns.Resolved←0
     :EndTrap
     lambdaresult.Err←errns
 :EndTrap
logInfo 'callHandler:' state
