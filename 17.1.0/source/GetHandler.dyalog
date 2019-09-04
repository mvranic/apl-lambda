handlername←getHandler;const;appparts;handlername;modulepath;handleravalible;fns
 appparts←'.'_split _HANDLER

 :If 2≢appparts
 :AndIf 2≠⊃⍴appparts
    ('Bad handler ',_HANDLER)⎕SIGNAL enCUSTOM
 :EndIf

 modulepath handlername←appparts
 modulepath←LAMBDA_TASK_ROOT,'/',modulepath
 logInfo 'Get handler:'
 logInfo 'modulepath:' modulepath
 logInfo 'handlername:' handlername

 fns←loadHandlerModule modulepath
 logInfo 'Ready fns:' fns
 handleravalible←(⊂handlername)∊fns

 :If ~handleravalible
    ('Handler ',handlername,' missing on module ',modulepath)⎕SIGNAL enCUSTOM
 :EndIf