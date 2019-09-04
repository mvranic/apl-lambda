 req←{json}makeRequest arg;method;url;headers;data;cmd
⍝ Use HttpCommand from Dyalog.
 method url headers data←arg

 cmd←⎕NEW HttpCommand
 cmd.Command←method
 cmd.URL←#.HOST,':',#.PORT,url
 :If 0≠⊃⍴cmd.Headers
     cmd.Headers←0 2⍴'' 
 :EndIf
 :If 0≠⎕NC 'json'
 :andif json=1
     cmd.Headers⍪←'content-type' 'application/json'
 :EndIf
 cmd.Headers⍪←headers
 :If 0≠⊃⍴data
     cmd.Params←⎕JSON data
 :EndIf
 logInfo 'Request to run:' cmd.Command cmd.URL cmd.Headers cmd.Params
 req←cmd.Run


