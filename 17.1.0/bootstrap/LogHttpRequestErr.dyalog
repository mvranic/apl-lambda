 logHttpRequestErr arg;msg;ts;id;ns;path;req
 path req←arg
 ts←⎕TS
 ns←⎕NS''
 ns.RequestHttpStatus←req.HttpStatus
 ns.RequestHttpMessage←req.HttpMessage
 ns.RequestHeaders←(↓req.Headers)
 ns.Name←path
 ns.TS←ts
 
 msg←⎕JSON ns
 _log msg