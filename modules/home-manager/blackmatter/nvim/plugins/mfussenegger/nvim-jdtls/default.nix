{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.mfussenegger."nvim-jdtls";
in
{
  options.blackmatter.programs.nvim.plugins.mfussenegger."nvim-jdtls".enable =
    mkEnableOption "mfussenegger/nvim-jdtls";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/mfussenegger/start/nvim-jdtls".source =
        builtins.fetchGit {
          url = "https://github.com/mfussenegger/nvim-jdtls";
          ref = "master";
          rev = "db08bfb87300fca2db91d15b64ca88a62970fb58";
        };
    })
  ];
}
