handlername←getHandler;appparts;module;fns;handleravalible
 appparts←'.'_split  _HANDLER

 :If 2≢appparts
 :AndIf 2≠⊃⍴appparts
    ('Bad handler ', _HANDLER)⎕SIGNAL  enCUSTOM
 :EndIf
 module handlername←appparts

 logInfo 'Get handler:'
 logInfo 'handlername:' handlername

 fns←loadHandlerModule module
 handleravalible←(⊂handlername)∊fns

 :If ~handleravalible
    ('Handler ',handlername,' missing on module ',module)⎕SIGNAL  enCUSTOM
 :EndIf