⎕←'Starting AWS lambda APL runtime...'
apphome←'/opt'

⎕CY  apphome,'/JSONServer/Distribution/JSONServer.dws'
⎕CY  apphome,'/aplasync/Distribution/aplasync.dws'
⎕CY  apphome,'/boostrap/Distribution/aplboostrap.dws'

setConstants
start

⎕←'Closing AWS lambda runtime.'
