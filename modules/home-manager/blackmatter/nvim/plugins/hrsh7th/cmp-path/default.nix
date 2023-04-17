{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.hrsh7th.cmp-path;
in
{
  options.blackmatter.programs.nvim.plugins.hrsh7th.cmp-path.enable =
    mkEnableOption "hrsh7th/cmp-path";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/hrsh7th/start/cmp-path".source =
        builtins.fetchGit {
          url = "https://github.com/hrsh7th/cmp-path";
          ref = "main";
          rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
        };
    })
  ];
}
