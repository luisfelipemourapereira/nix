{ config, lib, ... }:
with lib;
let
  # module scope
  cfg = config.blackmatter.envrc;

  # if a directory exists place an .envrc
  envrc = directory: envrc-path:
    if builtins.pathExists directory && (
      builtins.exec
        {
          command = "git";
          args = [ "rev-parse" "HEAD" ];
          cwd = directory;
          ignoreErrors = true;
        } != ""
    ) then
      builtins.symlinkJoin
        {
          name = "${directory}-envrc";
          target = envrc-path;
        }
    else null;

  # module actions
  actions = mkMerge [
    (envrc ~/code/t3rro/camelot ./camelot-envrc)
  ];

  # wrap the module up
  module = { config = actions; };
in
module
