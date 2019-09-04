setConstants;apphome;fnname;folder;lx;nr;port;server;timeout;wrrapername
 _empty←{0∊⍴⍵}
 _getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}
 _split←{a←,⍺
    w←a,⍵
    (⍴a)↓¨(a⍷w)⊂w
 }
 _lowcase←{819⌶⍵}

 logInfo'Start init. of APL lambda.'

 apphome←'/opt'
 folder←apphome,'/aplcode'
 logInfo'Folder with apl code:'folder


 #.RUNTIME_PATH←'/2018-06-01/runtime'
 #.enCUSTOM←996

 #.AWS_LAMBDA_FUNCTION_NAME←_getenv'AWS_LAMBDA_FUNCTION_NAME'
 logInfo'AWS_LAMBDA_FUNCTION_NAME:'#.AWS_LAMBDA_FUNCTION_NAME

 #.AWS_LAMBDA_FUNCTION_VERSION←_getenv'AWS_LAMBDA_FUNCTION_VERSION'
 logInfo'AWS_LAMBDA_FUNCTION_VERSION:'#.AWS_LAMBDA_FUNCTION_VERSION

 #.AWS_LAMBDA_FUNCTION_MEMORY_SIZE←_getenv'AWS_LAMBDA_FUNCTION_MEMORY_SIZE'
 logInfo'AWS_LAMBDA_FUNCTION_MEMORY_SIZE:'#.AWS_LAMBDA_FUNCTION_MEMORY_SIZE

 #.AWS_LAMBDA_LOG_GROUP_NAME←_getenv'AWS_LAMBDA_LOG_GROUP_NAME'
 logInfo'AWS_LAMBDA_LOG_GROUP_NAME:'#.AWS_LAMBDA_LOG_GROUP_NAME

 #.AWS_LAMBDA_LOG_STREAM_NAME←_getenv'AWS_LAMBDA_LOG_STREAM_NAME'
 logInfo'AWS_LAMBDA_LOG_STREAM_NAME:'#.AWS_LAMBDA_LOG_STREAM_NAME

 #.LAMBDA_TASK_ROOT←_getenv'LAMBDA_TASK_ROOT'
 logInfo'LAMBDA_TASK_ROOT:'#.LAMBDA_TASK_ROOT

 #._HANDLER←_getenv'_HANDLER'
 logInfo'_HANDLER:'#._HANDLER

 #.AWS_LAMBDA_RUNTIME_API←_getenv'AWS_LAMBDA_RUNTIME_API'
 logInfo'AWS_LAMBDA_RUNTIME_API:'#.AWS_LAMBDA_RUNTIME_API

 #.HOST #.PORT←':'_split #.AWS_LAMBDA_RUNTIME_API

 logInfo 'Dyalog:'
 ⎕PW←160
 logInfo '⎕PW:'⎕PW

 logInfo'End init. of APL lambda.'