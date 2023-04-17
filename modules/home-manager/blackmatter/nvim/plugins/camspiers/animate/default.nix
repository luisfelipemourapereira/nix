{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.camspiers.animate;
in
{
  options.blackmatter.programs.nvim.plugins.camspiers.animate.enable = mkEnableOption "camspiers/animate";

  config = mkMerge [
    (mkIf cfg.enable {
      # move split screens side to side
      home.file.".local/share/nvim/site/pack/camspiers/start/animate.vim".source =
        builtins.fetchGit {
          url = "https://github.com/camspiers/animate.vim";
          ref = "master";
          rev = "ca124da441b4d4ea721f33a999d4493e0d0a7a31";
        };
    })
  ];
}
