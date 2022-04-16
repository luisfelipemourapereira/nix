set: f: overrides: f ((builtins.intersectAttrs (builtins.functionArgs f) set) // overrides)
