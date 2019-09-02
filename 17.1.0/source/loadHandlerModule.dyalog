 fns←loadHandlerModule path;module;logmsg;nr;aplfile;file;files;dwsfile;dws;dwss;sink
 dwss←⊃{(⍵=2)/⍺}/0 1(⎕NINFO⍠1)∊1 ⎕NPARTS path,'/*.dws'
 :For dws :In dwss
     dwsfile←path,'/',dws
     logInfo'Loading ',dwsfile,' ...'
     ⎕CY dwsfile
 :EndFor
 files←⊃{(⍵=2)/⍺}/0 1(⎕NINFO⍠1)∊1 ⎕NPARTS path,'/*.dyalog'
 :For file :In files
     aplfile←path,'/',file
     logInfo'Loading ',aplfile,' ...'
     nr←⎕NGET aplfile
     sink←⎕FX nr
 :EndFor
 fns←' '~⍨¨↓⎕NL⊂3
 logmsg←'Avalibe functions:'fns
 logInfo logmsg  