lambdaresult←callHandler arg;handlername;event;context;execnsname;sink;stmt;currns;result;state;en;descrition;stack;errns
 handlername(event context)←arg

 logInfo'callHandler handler:'handlername
 logInfo'event:'event
 logInfo'context:'context

 lambdaresult←⎕NS''
 lambdaresult.Result←⍬
 lambdaresult.Err←⍬

 :Repeat
     execnsname←'#.lambdaexec',⊃,/⍕¨⎕TS,(?100000)
     logInfo'execnsname:'execnsname
 :Until 0≠⎕NC'execnsname'

 logInfo'lambdaModlueNamespaceName:'lambdaModlueNamespaceName
 logInfo'⍎lambdaModlueNamespaceName:'(⍎lambdaModlueNamespaceName)
 logInfo'⎕NS lambdaModlueNamespaceName:'(⎕NC lambdaModlueNamespaceName)

 sink←execnsname ⎕NS ⎕OR lambdaModlueNamespaceName

 :Trap 0
     logInfo'callHandler' 'Before callHandler call'
  stmt←execnsname,'.event←event'
  logInfo 'Prepare' stmt
  ⍎stmt
  logInfo (⍎execnsname,'.event')

  stmt←execnsname,'.context←context'
  logInfo 'Prepare' stmt
  ⍎stmt
   currns←''⎕NS''
   logInfo '(currns)' (currns)
   logInfo '(⍎currns)' (⍎currns)
   logInfo 'handlername' handlername
   logInfo '((⍎currns).handlername)' ((⍎currns).handlername)

   logInfo '(⍎currns).execnsname' ((⍎currns).execnsname)
   logInfo '⎕NC ''handlername'': ' (⎕NC 'handlername')
   logInfo '⎕NC handlername: ' (⎕NC handlername)
   logInfo '(⍎currns).handlername: ' ((⍎currns).handlername)
  ⍝
  logInfo '(⍎execnsname,''.context'')'(⍎execnsname,'.context')

  :With lambdaModlueNamespaceName
    (⍎currns).logInfo 'In with' ((⍎currns).lambdaModlueNamespaceName)
    (⍎currns).logInfo '⎕NL 3' (⎕NL 3)
    (⍎currns).logInfo '((⍎currns).handlername): '((⍎currns).handlername)
    (⍎currns).logInfo '(⎕NC (⍎currns).handlername): ' (⎕NC (⍎currns).handlername)
    (⍎currns).logInfo 'handlername: ' handlername
    (⍎currns).logInfo '(⎕NC handlername): ' (⎕NC handlername)
  :Endwith

  logInfo 'execnsname' execnsname
  logInfo '⎕NC ''execnsname''' (⎕NC 'execnsname')
  logInfo '((⍎currns).execnsname)' ((⍎currns).execnsname)
  :With execnsname
    (⍎currns).logInfo 'In with' execnsname
   ⍝ (⍎currns).logInfo 'In with' ((⍎currns).execnsname)
    (⍎currns).logInfo '⎕NL 3' (⎕NL 3)
    (⍎currns).logInfo 'handlername: ' handlername
    (⍎currns).logInfo '(⎕NC handlername): ' (⎕NC handlername)
   ⍝ (⍎currns).logInfo '((⍎currns).handlername): '((⍎currns).handlername)
   ⍝ (⍎currns).logInfo '(⎕NC (⍎currns).handlername): ' (⎕NC (⍎currns).handlername)

   ⍝   (⍎currns).logInfo '(⍎currns).execnsname' ((⍎currns).execnsname)
   ⍝      #.LambdaModlueNamespace.logInfo 'event: ' (⍎#.LambdaModlueNamespace.execnsname,'.event')
   ⍝      #.LambdaModlueNamespace.logInfo 'context: '(⍎#.LambdaModlueNamespace.execnsname,'.context')
         stmt←handlername,' ((⍎currns).event (⍎currns).context) '
         (⍎currns).logInfo 'stmt:'stmt
   ⍝      (⍎currns).result←⍎stmt
         result←⍎stmt
     :EndWith
     logInfo'callHandler' 'After callHandler call'
     lambdaresult.Result←(⍎execnsname).result
    ⍝ ⎕EX execnsname
    ⍝ stmt←'lambdaresult.Result←',execnsname,'.result'
    ⍝ logInfo'stmt'
    ⍝ ⍎stmt
     state←'OK'
 :Else
     ⎕EX execnsname
     state←'Error'
     :Trap 0
         en←⎕DMX.EN
         descrition←2↓⊃,/(⊂'\n '),¨(⎕DMX.DM),(⊂⎕DMX.Message)
         stack←⎕SI,¨'[',¨(⍕¨⎕LC),¨']'
         errns←toLambdaErr en descrition stack
         errns.Resolved←1
     :Else
         errns←⎕NS''
         errns.Resolved←0
     :EndTrap
     lambdaresult.Err←errns
 :EndTrap
 logInfo'callHandler:'state
