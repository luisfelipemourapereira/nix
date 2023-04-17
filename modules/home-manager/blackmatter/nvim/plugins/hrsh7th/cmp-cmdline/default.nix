{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.hrsh7th.cmp-cmdline;
in
{
  options.blackmatter.programs.nvim.plugins.hrsh7th.cmp-cmdline.enable =
    mkEnableOption "hrsh7th/cmp-cmdline";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/hrsh7th/start/cmp-cmdline".source =
        builtins.fetchGit {
          url = "https://github.com/hrsh7th/cmp-cmdline";
          ref = "main";
          rev = "8fcc934a52af96120fe26358985c10c035984b53";
        };
    })
  ];
}
