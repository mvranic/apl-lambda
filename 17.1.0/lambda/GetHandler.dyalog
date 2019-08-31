handlername←getHandler;const;appparts;handlername;modulepath;userhandler;fns
 appparts←'.'_split _HANDLER

 :If 2≢appparts
 :AndIf 2≠⊃⍴appparts
    ('Bad handler ',_HANDLER)⎕SIGNAL enCUSTOM
 :EndIf

 modulepath handlername←appparts

 fns←loadHandlerModule LAMBDA_TASK_ROOT,'/',modulepath
 userhandler←(⊂handlername)∊fns

 :If ~userhandler
    ('Handler ',handlername,' missing on module ',modulepath)⎕SIGNAL enCUSTOM
 :EndIf