res←initError arg;context;err
⍝ Argument context must be namesapce with context arguments.
 err context←arg
 res←postError(RUNTIME_PATH'/init/error')err