{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.LnL7.vim-nix;
in
{
  options.blackmatter.programs.nvim.plugins.LnL7.vim-nix.enable =
    mkEnableOption "LnL7/vim-nix";

  config = mkMerge [
    (mkIf cfg.enable {
      # nix syntax highlighting
      home.file.".local/share/nvim/site/pack/LnL7/start/vim-nix".source =
        builtins.fetchGit {
          url = "https://github.com/LnL7/vim-nix";
          ref = "master";
          rev = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee";
        };
    })
  ];
}
