 fns←loadHandlerModule module;packagefile;package;json;encoding;newline;sink;dws;dwsfile;path;nr;fn;file;dyalogfile;logmsg

 path←#.LAMBDA_TASK_ROOT
 packagefile←path,'/',module,'.package.json'

 logInfo 'loadHandlerModule package file:' packagefile
 json encoding newline←⎕NGET packagefile
 sink←encoding newline
 package←⎕JSON json
 sink←'LambdaModlueNamespace'NS '⎕'
 :For dws :In package.DwsFiles
     dwsfile←path,'/',dws
     logInfo'Loading ',dwsfile,' ...'
     :With lambdaModlueNamespace
        ⎕CY dwsfile
     :endwith
 :EndFor
 :For file :In package.DyalogFiles
     dyalogfile←path,'/',file
     logInfo'Loading ',dyalogfile,' ...'
     nr encoding newline←⎕NGET dyalogfile
     nr←⎕UCS (⎕UCS nr)~13
     nr←(⎕UCS 10)_split nr
     :With lambdaModlueNamespace
        ##.fn←⎕FX nr
     :Endwith
     logInfo'Fixed: ',fn
 :EndFor

 :With lambdaModlueNamespace
   ##.fns←' '~⍨¨↓⎕NL⊂3
 :Endwith
 logmsg←'Avalibe functions:'fns
 logInfo logmsg