loadAplLambda;sink
#.APPHOME←'/opt'
sink←aplLambdaNsName ⎕ ''
:With aplLambdaNsName 
    ⎕CY  #.APPHOME,'/Distribution/apllambda.dws'
    aplLambdaBootstrap
:EndWith
