{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.neovim.nvim-lspconfig;
in
{
  options.blackmatter.programs.nvim.plugins.neovim.nvim-lspconfig.enable = mkEnableOption "neovim/nvim-lspconfig";

  config = mkMerge [
    (mkIf cfg.enable {
      # general lsp configurations
      home.file.".local/share/nvim/site/pack/neovim/start/nvim-lspconfig".source =
        builtins.fetchGit {
          url = "https://github.com/neovim/nvim-lspconfig";
          ref = "master";
          # rev = "95b7a69bc6da2a6a740584ea3c555e5327638b7d";
          rev = "0d29cad8de3b2c654315203fc1fe12fde722a18a";
        };
    })
  ];
}
