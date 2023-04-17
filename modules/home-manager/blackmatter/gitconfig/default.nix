{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.gitconfig;
in
{
  options = {
    blackmatter = {
      gitconfig.enable = mkEnableOption "blackmatter.gitconfig";

      gitconfig.email = mkOption {
        type = types.str;
        description = mdDoc "gitconfig user email";
      };

      gitconfig.user = mkOption {
        type = types.str;
        description = mdDoc "gitconfig user";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".gitconfig".text = ''
        [user]
					email = ${cfg.email}
					name = ${cfg.user}

        [merge]
					default = merge

        [core]
					pager = delta --dark --line-numbers

        [delta]
					side-by-side = true
      '';
    })
  ];
}
