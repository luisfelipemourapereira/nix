{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.camspiers.lens;
in
{
  options.blackmatter.programs.nvim.plugins.camspiers.lens.enable = mkEnableOption "camspiers/lens";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/camspiers/start/lens.vim".source =
        builtins.fetchGit {
          url = "https://github.com/camspiers/lens.vim";
          ref = "master";
          rev = "099c3502d001f7081edf113de57e8b1cfd121c55";
        };
    })
  ];
}
