aplLambdaBootstrap;code;enc;split;path;sink;code
_getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}
LOGINFO←~'0'≡⍕_getenv  'APLLOGINFO'
⎕PW←160
 
logInfo 'Starting AWS lambda APL runtime...'
logInfo ' APPHOME=' APPHOME 

⍝⎕CY  APPHOME,'/JSONServer/Distribution/JSONServer.dws'
⎕CY  APPHOME,'/mdyalog/17.1/64/unicode/ws/conga.dws'
path←APPHOME,'/mdyalog/17.1/64/unicode/Library/Conga/'
code enc split←⎕NGET path,'FtpClient.dyalog'
code←(⎕UCS split) textSplit code
logInfo 'Fixed:' (⎕FIX code)

code enc split←⎕NGET path,'HttpCommand.dyalog'
code←(⎕UCS split) textSplit code
logInfo 'Fixed:' (⎕FIX code)

code enc split←⎕NGET path,'HttpUtils.dyalog'
code←(⎕UCS split) textSplit code
logInfo 'Fixed:' (⎕FIX code)

code enc split←⎕NGET path,'InitConga.dyalog' 
code←(⎕UCS split) textSplit code
logInfo 'Fixed:' (⎕FX code)

DRC←(InitConga 'myApp').rootref

⎕CY  APPHOME,'/aplasync/Distribution/aplasync.dws'

setConstants
start

logInfo 'Closing AWS lambda runtime.'
⎕OFF 0
