 req←makeRequest arg;method;url;headers;data;cmd;fullurl
 ⍝ Use HttpCommand from Dyalog.
 method url headers data←arg

 cmd←⎕NEW HttpCommand
 fullurl←'http://',HOST,':',PORT,url
 logInfo'Request to run: 'method fullurl headers
 req←cmd.Do method fullurl data headers


