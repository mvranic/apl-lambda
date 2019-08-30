 req←makeRequest arg;method;url;headers;data;cmd
⍝ Use HttpCommand from Dyalog.
 method url headers data←arg

 cmd←⎕NEW HttpCommand
 cmd.Command←method
 cmd.URL←url
⍝ cmd.Headers⍪←'content-type' 'application/json'
 :If 0≠⊃⍴cmd.Headers
      cmd.Headers⍪←headers 
 :EndIf
 :If 0≠⊃⍴data
     cmd.Params←⎕JSON data
 :EndIf
 req←cmd.Run


