{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins.nathom.filetype;
in
{
  options.blackmatter.programs.nvim.plugins.nathom.filetype.enable = mkEnableOption "nathom/filetype";

  config = mkMerge [
    (mkIf cfg.enable {
      # control filetype assignment in Lua
      home.file.".local/share/nvim/site/pack/nathom/start/filetype.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/nathom/filetype.nvim";
          ref = "main";
          rev = "b522628a45a17d58fc0073ffd64f9dc9530a8027";
        };
    })
  ];
}
