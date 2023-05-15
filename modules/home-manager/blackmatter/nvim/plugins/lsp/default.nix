{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.lsp;
in
{
  options.blackmatter.programs.nvim.plugin.groups.lsp =
    {
      enable = mkEnableOption "lsp";
    };

  imports = [
    ../neovim/nvim-lspconfig
    ../williamboman/mason.nvim
    ../williamboman/mason-lspconfig.nvim
    ../jose-elias-alvarez/null-ls
    ../ray-x/lsp_signature
    ../onsails/lspkind.nvim
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          # TODO: needs a valid macos build
          # TODO: turning off until a valid build
          # TODO: is created for the rust dependency
          blackmatter.programs.nvim.plugins =
            {
              neovim.nvim-lspconfig.enable = true;
              williamboman."mason.nvim".enable = true;
              williamboman."mason-lspconfig.nvim".enable = true;
              jose-elias-alvarez.null-ls.enable = true;
              ray-x.lsp_signature.enable = true;
              onsails."lspkind.nvim".enable = true;
            };
        }
      )
    ];
}
