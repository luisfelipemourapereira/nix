{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.williamboman."mason-lspconfig.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.williamboman."mason-lspconfig.nvim".enable =
    mkEnableOption "williamboman/mason-lspconfig.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/williamboman/start/mason-lspconfig.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/williamboman/mason-lspconfig.nvim";
          ref = "main";
          # rev = "a8d5db8f227b9b236d1c54a9c6234bc033825ce7";
          rev = "e86a4c84ff35240639643ffed56ee1c4d55f538e";
        };
    })
  ];
}
