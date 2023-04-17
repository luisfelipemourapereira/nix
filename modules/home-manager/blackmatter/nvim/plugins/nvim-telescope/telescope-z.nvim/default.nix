{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-z.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-z.nvim".enable =
    mkEnableOption "nvim-telescope/telescope-z.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/nvim-telescope/start/telescope-z.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-telescope/telescope-z.nvim";
          ref = "main";
          rev = "64e5adc84acd1cd73fd401c026fda54dccd78f72";
        };
    })
  ];
}
