res←initError arg;context;err;errns
⍝ Argument context must be namesapce with context arguments.
 errns context←arg
 err←⎕JSON errns
 res←postError(RUNTIME_PATH'/init/error')err