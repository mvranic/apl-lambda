logMsg msg;type;val;typetext;ts;reqid
⍝ Todo add context to arguments.
type val←msg 
    
:Select type
:Case 1
   typetext←'[ERROR]' 
:Case 2
   typetext←'[INFO]' 
:Else
   typetext←'[MISC]'     
:EndSelect
y M d h m s ms ← ⍕¨ ⎕TS
ts←y,'-',M,'-',d,'T',h,':',m,':',s,'.',ms,'Z'

 :trap 0
   reqid←#.AplLambdaNsName.context.awsRequestId
 :else 
   reqid←'unknown-reuestq-id'
 :Endtrap

⎕←typetext ts reqid  val