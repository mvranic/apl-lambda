logInfo msg
:If 0=⎕NC '#.LOGINFO'
:OrIf #.LOGINFO
  logMsg 'INFO:' msg
:Endif