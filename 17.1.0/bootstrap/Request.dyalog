req←request arg;reg;data;port;host
⍝ Return: Promise on request.
⍝ Needed github.com/mvranic/aplpromises
 host port data←arg
 reg←promiseMe'makeRequest'(host port data)