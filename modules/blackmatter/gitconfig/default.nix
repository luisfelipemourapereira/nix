{ config, lib, ... }:
with lib;
let
  # module scope
  cfg = config.blackmatter.gitconfig;

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
# [user]
#   email = t3rro@protonmail.com
#   name = t3rro
#
# [merge]
#   default = merge
#
# [core]
#   pager = delta --dark --line-numbers
#
# [delta]
#   side-by-side = true
