handlername←getHandler;appparts;module;fns;handleravalible
 appparts←'.'_split #._HANDLER

 :If 2≢appparts
 :AndIf 2≠⊃⍴appparts
    ('Bad handler ',#._HANDLER)⎕SIGNAL #.enCUSTOM
 :EndIf
 module handlername←appparts

 logInfo 'Get handler:'
 logInfo 'handlername:' handlername

 fns←loadHandlerModule module
 logInfo 'Ready fns:' fns
 handleravalible←(⊂handlername)∊fns

 logInfo 'Handler avalible:'handleravalible
 :If ~handleravalible
    ('Handler ',handlername,' missing on module ',module)⎕SIGNAL #.enCUSTOM
 :EndIf