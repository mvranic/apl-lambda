 req←{json}makeRequest arg;method;url;headers;data;cmd
⍝ Use HttpCommand from Dyalog.
 method url headers data←arg

 cmd←⎕NEW HttpCommand
 cmd.Command←method
 cmd.URL←url
 :If 0≠⎕NC 'json'
 :andif json=1
     cmd.Headers⍪←'content-type' 'application/json'
 :EndIf
 :If 0≠⊃⍴cmd.Headers
     cmd.Headers⍪←headers 
 :EndIf
 :If 0≠⊃⍴data
     cmd.Params←⎕JSON data
 :EndIf
 req←cmd.Run


