 logHttpRequestErr arg;msg;ts;id;errns;path;req
 path req←arg
 ts←⎕TS
 errns←⎕NS''
 errns.RequestHttpStatus←req.HttpStatus
 errns.RequestHttpMessage←req.HttpMessage
 errns.RequestHeaders←(↓req.Headers)
 errns.Name←path
 errns.TS←ts
 
 logErrNs ns