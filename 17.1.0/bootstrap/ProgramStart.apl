programStart;_empty;_getenv;_log;apphome;fnname;folder;lx;nr;port;server;timeout;wrrapername
 _empty←{0∊⍴⍵}
 _getenv←{2 ⎕NQ'.' 'GetEnvironment'⍵}
 _log←{⎕←⍵}
 _split←{a←,⍺
    w←a,⍵
    (⍴a)↓¨(a⍷w)⊂w
 }

 _log'Start init. of APL lambda.'

 apphome←'/opt'
 folder←apphome,'/aplcode'
 _log'Folder with apl code:'folder


 RUNTIME_PATH←'/2018-06-01/runtime'

 #.AWS_LAMBDA_FUNCTION_NAME←_getenv'AWS_LAMBDA_FUNCTION_NAME'
 _log'AWS_LAMBDA_FUNCTION_NAME:'#.AWS_LAMBDA_FUNCTION_VERSION

 #.AWS_LAMBDA_FUNCTION_VERSION←_getenv'AWS_LAMBDA_FUNCTION_VERSION'
 _log'AWS_LAMBDA_FUNCTION_VERSION:'#.AWS_LAMBDA_FUNCTION_VERSION

 #.AWS_LAMBDA_FUNCTION_MEMORY_SIZE←_getenv'AWS_LAMBDA_FUNCTION_MEMORY_SIZE'
 _log'AWS_LAMBDA_FUNCTION_MEMORY_SIZE:'#.AWS_LAMBDA_FUNCTION_MEMORY_SIZE

 #.AWS_LAMBDA_LOG_GROUP_NAME←_getenv'AWS_LAMBDA_LOG_GROUP_NAME'
 _log'AWS_LAMBDA_LOG_GROUP_NAME:'#.AWS_LAMBDA_LOG_GROUP_NAME

 #.AWS_LAMBDA_LOG_STREAM_NAME←_getenv'AWS_LAMBDA_LOG_STREAM_NAME'
 _log'AWS_LAMBDA_LOG_STREAM_NAME:'#.AWS_LAMBDA_LOG_STREAM_NAME

 #.LAMBDA_TASK_ROOT←_getenv'LAMBDA_TASK_ROOT'
 _log'LAMBDA_TASK_ROOT:'#.LAMBDA_TASK_ROOT

 #._HANDLER←_getenv'_HANDLER'
 _log'_HANDLER:'#._HANDLER

 #.AWS_LAMBDA_RUNTIME_API←_getenv'AWS_LAMBDA_RUNTIME_API'
 _log'AWS_LAMBDA_RUNTIME_API:'#.AWS_LAMBDA_RUNTIME_API

 #.HOST #.PORT←':'_split #.AWS_LAMBDA_RUNTIME_API

 start

 _log'End init. of APL lambda.'