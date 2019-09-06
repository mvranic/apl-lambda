aplLambdaBootstrap
_getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}
#.LOGINFO←~'0'≡⍕_getenv  'APLLOGINFO'
 
logInfo 'Starting AWS lambda APL runtime...'
#.APPHOME←'/opt'
logInfo '#.APPHOME='#.APPHOME 

⎕CY  #.APPHOME,'/JSONServer/Distribution/JSONServer.dws'
⎕CY  #.APPHOME,'/aplasync/Distribution/aplasync.dws'

setConstants
start

logInfo 'Closing AWS lambda runtime.'
⎕OFF 0
