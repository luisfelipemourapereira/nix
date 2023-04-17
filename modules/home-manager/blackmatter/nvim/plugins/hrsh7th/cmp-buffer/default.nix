{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.hrsh7th.cmp-buffer;
in
{
  options.blackmatter.programs.nvim.plugins.hrsh7th.cmp-buffer.enable =
    mkEnableOption "hrsh7th/cmp-buffer";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/hrsh7th/start/cmp-buffer".source =
        builtins.fetchGit {
          url = "https://github.com/hrsh7th/cmp-buffer";
          ref = "main";
          rev = "3022dbc9166796b644a841a02de8dd1cc1d311fa";
        };
    })
  ];
}
