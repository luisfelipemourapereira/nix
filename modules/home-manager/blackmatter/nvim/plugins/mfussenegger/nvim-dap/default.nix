{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.mfussenegger."nvim-dap";
in
{
  options.blackmatter.programs.nvim.plugins.mfussenegger."nvim-dap".enable =
    mkEnableOption "mfussenegger/nvim-dap";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/mfussenegger/start/nvim-dap".source =
        builtins.fetchGit {
          url = "https://github.com/mfussenegger/nvim-dap";
          ref = "master";
          rev = "75a94b8b577a970c0cad25a54a64dc40fc6fa0ea";
        };
    })
  ];
}
