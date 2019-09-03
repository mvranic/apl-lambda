bootstrap;apphome
logInfo 'Starting AWS lambda APL runtime...'
apphome←'/opt'

⎕CY  apphome,'/JSONServer/Distribution/JSONServer.dws'
⎕CY  apphome,'/aplasync/Distribution/aplasync.dws'

setConstants
start

logInfo 'Closing AWS lambda runtime.'
⎕OFF 0