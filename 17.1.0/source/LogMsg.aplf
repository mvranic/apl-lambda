logMsg msg;type;val;typetext;ts;reqid;y;M;d;h;m;s;ms
⍝ Todo add context to arguments.
⍝ Todo add the calling function (can be found in []SI
 type val←msg

 :Select type
 :Case 1
     typetext←'[ERROR]'
 :Case 2
     typetext←'[INFO]'
 :Else
     typetext←'[MISC]'
 :EndSelect
 y M d h m s ms←⍕¨⎕TS
 ts←y,'-',M,'-',d,'T',h,':',m,':',s,'.',ms,'Z'

 :Trap 0
     reqid←#.AplLambdaNsName.context.awsRequestId
 :Else
     reqid←'unknown-reuestq-id'
 :EndTrap

 ⎕←typetext ts reqid val
