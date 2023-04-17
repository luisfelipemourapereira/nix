{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.hrsh7th.cmp-nvim-lsp;
in
{
  options.blackmatter.programs.nvim.plugins.hrsh7th.cmp-nvim-lsp.enable =
    mkEnableOption "hrsh7th/cmp-nvim-lsp";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/hrsh7th/start/cmp-nvim-lsp".source =
        builtins.fetchGit {
          url = "https://github.com/hrsh7th/cmp-nvim-lsp";
          ref = "main";
          rev = "0e6b2ed705ddcff9738ec4ea838141654f12eeef";
        };
    })
  ];
}
