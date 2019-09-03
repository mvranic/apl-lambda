res←initError err
⍝ Argument context must be namesapce with context arguments.
 res←⍬
 :Trap #.enCUSTOM
    res←postError(RUNTIME_PATH,'/init/error')err
 :EndTrap
 