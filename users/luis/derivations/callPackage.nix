# functionArgs f
# Return a set containing the names of the formal arguments expected by the function f. The value of each attribute is a Boolean denoting whether the corresponding argument has a default value. For instance, functionArgs ({ x, y ? 123}: ...) = { x = false; y = true; }. */
path: overrides:
  let f = import path;
  in f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
