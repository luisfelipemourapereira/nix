{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.tpope.vim-fugitive;
in
{
  options.blackmatter.programs.nvim.plugins.tpope.vim-fugitive.enable = mkEnableOption "tpope/vim-fugitive";

  config = mkMerge [
    (mkIf cfg.enable {
      # Git commands
      home.file.".local/share/nvim/site/pack/tpope/start/vim-fugitive".source =
        builtins.fetchGit {
          url = "https://github.com/tpope/vim-fugitive";
          ref = "master";
          rev = "2febbe1f00be04f16daa6464cb39214a8566ec4b";
        };
    })
  ];
}
