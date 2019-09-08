 req←{json}makeRequest arg;method;url;headers;data;cmd
⍝ Use HttpCommand from Dyalog.
 method url headers data←arg
logInfo 'makeRequest url:'headers 
logInfo 'makeRequest data:'data
 
 cmd←⎕NEW HttpCommand
 cmd.Command←method
 cmd.URL←'http://', HOST,':', PORT,url
 logInfo 'cmd.URL:'cmd.URL
 logInfo '⎕NC cmd.URL:'(⎕NC'cmd.URL')
 logInfo '≡cmd.URL:'(≡cmd.URL)
 logInfo '⎕DR cmd.URL:'(⎕DR cmd.URL)
 cmd.Headers←0 2⍴'' ⍝ Why I have to do this? 
 :If 0≠⎕NC 'json'
 :andif json=1
     cmd.Headers⍪←'content-type' 'application/json'
 :EndIf
 logInfo 'headers:'headers
 logInfo '⎕NC headers:'(⎕NC'headers')
 logInfo '≡headers:'(≡headers)
 logInfo '⎕DR headers:'(⎕DR headers)
 
 logInfo 'cmd.Headers:'cmd.Headers
 logInfo '⎕NC cmd.Headers:'(⎕NC'cmd.Headers')
 logInfo '⍴cmd.Headers:'(⍴cmd.Headers)
 logInfo '≡cmd.Headers:'(≡cmd.Headers)
 logInfo '⎕DR cmd.Headers:' (⎕DR cmd.Headers)
 :if 0≠⊃⍴headers
     cmd.Headers⍪←headers
 :EndIf
 :If 0≠⊃⍴data
     logInfo 'data:'data
     logInfo '⎕NC data:'(⎕NC'data')
     logInfo '⍴data:'(⍴data)
     logInfo '≡data:'(≡data)
     logInfo '⎕DR data:' (⎕DR data)
     cmd.Params←⎕JSON data
 :EndIf
 logInfo 'Request to run:' cmd.Command cmd.URL cmd.Headers cmd.Params
 req←cmd.Run


