loadAplLambda;sink
#.APPHOME←'/opt'
sink←aplLambdaNsName ⎕NS''
:With aplLambdaNsName 
    ⎕CY #.APPHOME,'/apllambda/Distribution/apllambda.dws'
    APPHOME←#.APPHOME
    aplLambdaBootstrap
    ⎕EX'#.APPHOME'
:EndWith
