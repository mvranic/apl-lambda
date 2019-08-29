⎕←'Starting AWS lambda APL runtime...'
⍝apphome←'/opt'

⍝sink←⎕FX⊃⎕NGET (apphome,'/init/StartJsonServer.apl')1
⍝startJsonServer

setConstants
start

⎕←'Closing AWS lambda runtime.'
