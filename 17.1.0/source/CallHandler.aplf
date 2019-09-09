lambdaresult←callHandler arg;handlername;event;context;execnsname;sink;stmt;currns;result;state;en;descrition;stack;errns
 handlername(event context)←arg

 logInfo'callHandler handler:'handlername
 
 lambdaresult←⎕NS''
 lambdaresult.Result←⍬
 lambdaresult.Err←⍬

 :Repeat
     execnsname←'#.lambdaexec',⊃,/⍕¨⎕TS,(?100000)
     logInfo'execnsname:'execnsname
 :Until 0≠⎕NC'execnsname'

 sink←execnsname ⎕NS ⎕OR lambdaModlueNamespaceName

 :Trap 0
  stmt←execnsname,'.event←event'
  ⍎stmt

  stmt←execnsname,'.context←context'
  ⍎stmt
  currns←''⎕NS''

  :With execnsname
    (⍎currns).logInfo ('⎕NL⊂3 in namespace ',execnsname, ':') (⎕NL⊂3)
    stmt←handlername,' ((⍎currns).event (⍎currns).context) '
    (⍎currns).logInfo 'Call statmanet:'stmt
    result←⍎stmt
  :EndWith
  lambdaresult.Result←(⍎execnsname).result
  state←'OK'
 :Else
     ⎕EX execnsname
     state←'Error'
     :Trap 0
         en←⎕DMX.EN
         descrition←2↓⊃,/(⊂'\n '),¨(⎕DMX.DM),(⊂⎕DMX.Message)
         stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']' ⍝ Not eal stack.
         errns←toLambdaErr en descrition stack
         errns.Resolved←1
     :Else
         errns←⎕NS''
         errns.Resolved←0
     :EndTrap
     lambdaresult.Err←errns
 :EndTrap
 logInfo'callHandler:'state
