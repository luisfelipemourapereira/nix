{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-dap.nvim";
in
{
  options.blackmatter.programs.nvim.plugins.nvim-telescope."telescope-dap.nvim".enable =
    mkEnableOption "nvim-telescope/telescope-dap.nvim";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/nvim-telescope/start/telescope-dap.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nvim-telescope/telescope-dap.nvim";
          ref = "master";
          rev = "313d2ea12ae59a1ca51b62bf01fc941a983d9c9c";
        };
    })
  ];
}
