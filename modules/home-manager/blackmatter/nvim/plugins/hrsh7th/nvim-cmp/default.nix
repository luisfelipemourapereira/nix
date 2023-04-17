{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.hrsh7th.nvim-cmp;
in
{
  options.blackmatter.programs.nvim.plugins.hrsh7th.nvim-cmp.enable = mkEnableOption "hrsh7th/nvim-cmp";

  config = mkMerge [
    (mkIf cfg.enable {
      # plugin for completion hooks
      home.file.".local/share/nvim/site/pack/hrsh7th/start/nvim-cmp".source =
        builtins.fetchGit {
          url = "https://github.com/hrsh7th/nvim-cmp";
          ref = "main";
          rev = "11a95792a5be0f5a40bab5fc5b670e5b1399a939";
        };
    })
  ];
}
