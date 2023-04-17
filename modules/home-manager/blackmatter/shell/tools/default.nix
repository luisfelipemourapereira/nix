{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      shell.tools.enable = mkEnableOption "shell.tools";
    };
  };
  config = mkMerge [
    (mkIf cfg.shell.tools.enable {
      programs.jq.enable = true;
      programs.direnv.enable = true;
    })
  ];
}
