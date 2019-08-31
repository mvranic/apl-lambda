handlertask←getHandler;const;appparts;handlername;modulepath;userhandler;fns
 const appparts←'.'_split _HANDLER

 :If 2≢appparts
 :AndIf 2≠⊃⍴appparts
    ('Bad handler ',_HANDLER)⎕SIGNAL enCUSTOM
 :EndIf

 modulepath handlername←appparts

⍝⍝ Let any errors here be thrown as-is to aid debugging
 fns←loadHandlerModule LAMBDA_TASK_ROOT,'/',modulepath
⍝ app←require(LAMBDA_TASK_ROOT+'/'+modulePath)

 userhandler←(⊂handlername)∊fns

 :If ~userhandler
    ('Handler ',handlername,' missing on module ',modulepath)⎕SIGNAL enCUSTOM
 :EndIf

 handlertask←asyncTask'getHandler_Do'(resolve reject)