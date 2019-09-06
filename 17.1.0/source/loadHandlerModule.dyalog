 fns←loadHandlerModule module;packagefile;package;json;encoding;newline;sink;dws;dwsfile;path;nr;fn;file;dyalogfile;logmsg

 path←#.LAMBDA_TASK_ROOT
 packagefile←path,'/',module,'.package.json'

 logInfo 'loadHandlerModule package file:' packagefile
 json encoding newline←⎕NGET packagefile
 sink←encoding newline
 package←⎕JSON json
 :For dws :In package.DwsFiles
     dwsfile←path,'/',dws
     logInfo'Loading ',dwsfile,' ...'
     ⎕CY dwsfile
 :EndFor
 :For file :In package.DyalogFiles
     dyalogfile←path,'/',file
     logInfo'Loading ',dyalogfile,' ...'
     nr encoding newline←⎕NGET dyalogfile
     nr←⎕UCS (⎕UCS nr)~13
     nr←(⎕UCS 10)_split nr
     fn←⎕FX nr
     logInfo'Fixed: ',fn
 :EndFor

 fns←' '~⍨¨↓⎕NL⊂3
 logmsg←'Avalibe functions:'fns
 logInfo logmsg