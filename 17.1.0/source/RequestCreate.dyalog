req←requestCreate arg;data;port;host
⍝ Return: Promise on request.
⍝ Needed github.com/mvranic/aplasync
 method url headers data←arg
 req←asyncTask'makeRequest'(method url headers data)