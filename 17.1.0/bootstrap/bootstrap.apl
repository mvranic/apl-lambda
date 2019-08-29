⎕←'Starting AWS lambda APL runtime...'
⍝apphome←'/opt'

⍝sink←⎕FX⊃⎕NGET (apphome,'/init/StartJsonServer.apl')1
⍝startJsonServer

programStart

⎕←'Closing AWS lambda runtime.'
