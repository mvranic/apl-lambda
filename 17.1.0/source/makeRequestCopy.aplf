 req←{json}makeRequestCopy arg
⍝ ;method;url;headers;data;cmd;payload
⍝ Use HttpCommand from Dyalog.
 method url headers data←arg
 
 cmd←⎕NEW HttpCommand
 cmd.Command←method
 cmd.URL←'http://', HOST,':', PORT,url
 cmd.Headers←0 2⍴'' ⍝ Why I have to do this? 
 :If 0≠⎕NC 'json'
 :andif json=1
     cmd.Headers⍪←'content-type' 'application/json'
 :EndIf
 
 :if 0≠⊃⍴headers
     cmd.Headers⍪←headers
 :EndIf
 :If 0≠⊃⍴data
     logInfo'makeRequest:' data
     payload←⎕NS''
  ⍝   payload.message←data
     payload.message←'dummy'
     cmd.Params←⎕JSON payload
 :EndIf
 logInfo 'Request to run: ' cmd.Command cmd.URL cmd.Headers cmd.Params
 req←cmd.Run


