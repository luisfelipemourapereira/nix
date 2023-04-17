{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      fonts.enable = mkEnableOption "fonts";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.fonts.enable {
        fonts.fonts = with pkgs;[
          fira-code
          fira-code-symbols
        ];
      })
    ];
}
