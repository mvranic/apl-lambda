 fns←loadHandlerModule module;packagefile;package;json;encoding;newline;sink;dws;dwsfile;path;nr;fn;file;dyalogfile

 path← LAMBDA_TASK_ROOT
 packagefile←path,'/',module,'.package.json'

 logInfo 'loadHandlerModule package file:' packagefile
 json encoding newline←⎕NGET packagefile
 sink←encoding newline
 package←⎕JSON json
 sink←lambdaModlueNamespaceName ⎕NS''
 :For dws :In package.DwsFiles
     dwsfile←path,'/',dws
     logInfo'Loading ',dwsfile,' ...'
     :With lambdaModlueNamespaceName
        ⎕CY dwsfile
     :endwith
 :EndFor
 :For file :In package.DyalogFiles
     dyalogfile←path,'/',file
     logInfo'Loading ',dyalogfile,' ...'
     nr encoding newline←⎕NGET dyalogfile
     nr←⎕UCS(⎕UCS nr)~13 ⍝ newline was not realy used as spliter but just /n.
     nr←(⎕UCS 10)textSplit nr
     :With lambdaModlueNamespaceName
        fn←⎕FX nr
     :Endwith
     logInfo'Fixed: ',fn
 :EndFor

 :With lambdaModlueNamespaceName
    fns←' '~⍨¨↓⎕NL⊂3
 :Endwith
 logInfo'Avalibe functions in namespace ',lambdaModlueNamespaceName,':'fns
 