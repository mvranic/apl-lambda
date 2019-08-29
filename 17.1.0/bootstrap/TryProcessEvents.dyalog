tryProcessEvents handler
:Trap 0
    processEvents handler
:Else
    _log ⎕DMX
    ⎕OFF 1
:EndTrap