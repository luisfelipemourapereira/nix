{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      shell.fzf.enable = mkEnableOption "shell.fzf";
    };
  };
  config = mkMerge [
    (mkIf config.blackmatter.shell.fzf.enable {
      programs.fzf.enable = true;
      programs.fzf.enableZshIntegration = true;
    })
  ];
}
