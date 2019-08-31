req←request arg;reg;data;port;host
⍝ Return: Promise on request.
⍝ Needed github.com/mvranic/aplasync
 method url headers data←arg
 reg←asyncTask'makeRequest'(method url headers data)