 logHttpRequestErr arg;msg;ts;id;errns;path;req;headers
 path req←arg
 ts←⎕TS
 errns←⎕NS''
 errns.RequestHttpStatus←req.HttpStatus
 errns.RequestHttpMessage←req.HttpMessage
 headers←↓req.Headers
 :if 0=⊃⍴headers
    headers←⍬
 :endif
 errns.RequestHeaders←headers
 errns.Name←path
 errns.TS←ts
 
 logErrNs errns