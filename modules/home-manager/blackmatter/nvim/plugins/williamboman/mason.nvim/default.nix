{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.williamboman."mason.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.williamboman."mason.nvim".enable =
    mkEnableOption "williamboman/mason.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/williamboman/start/mason.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/williamboman/mason.nvim";
          ref = "main";
          # rev = "add6d1d63d8b86af951ba64b4157fe6b0af173d4";
          rev = "74eac861b013786bf231b204b4ba9a7d380f4bd9";
        };


      # TODO: move this hack to a more reasonable location
      # mason manages language servers.  Some of the binaries
      # it downloads don't work.  One of these is lua_ls.
      # the approach is then to link to a well known derivation
      # to where mason expects the language server binary to be.
      home.file.".local/share/nvim/mason/packages/lua-language-server/bin/lua-language-server".source =
        "${pkgs.sumneko-lua-language-server}/bin/lua-language-server";
    })
  ];
}
