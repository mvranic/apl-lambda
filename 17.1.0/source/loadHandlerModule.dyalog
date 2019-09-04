 fns←loadHandlerModule path;module;logmsg;nr;file;files;dwsfile;dws;dwss;sink;fn;encoding;newline
 dwss←⊃{(⍵=2)/⍺}/0 1(⎕NINFO⍠1)∊1 ⎕NPARTS path,'/*.dws'
 :For dws :In dwss
     dwsfile←path,'/',dws
     logInfo'Loading ',dwsfile,' ...'
     ⎕CY dwsfile
 :EndFor
 files←⊃{(⍵=2)/⍺}/0 1(⎕NINFO⍠1)∊1 ⎕NPARTS path,'/*.dyalog'
 :For file :In files
     logInfo'Loading ',file,' ...'
     nr encoding newline←⎕NGET file
     nr←⎕UCS (⎕UCS nr)~13
     nr←(⎕UCS 10)_split nr
     fn←⎕FX nr
     logInfo'Fixed: ',fn
 :EndFor
 fns←' '~⍨¨↓⎕NL⊂3
 logmsg←'Avalibe functions:'fns
 logInfo logmsg  