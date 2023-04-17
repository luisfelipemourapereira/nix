{ config, lib, ... }:
with lib;
let
  # module scope
  cfg = config.blackmatter.users.luis;

  # interface for users
  opts = {
    mode = mkOption { };
    name = mkOption { };
    home = mkOption { };
    env = mkOption { };
  };

  # module actions
  actions = mkMerge [
    ({
      # setup a .gitconfig for the user
      home.file.".gitconfig".text = ''
        [user]
        email = ${cfg.name}
      '';
    })
  ];
in
{
  options.blackmatter.users.luis = opts;
  config = actions;
}
