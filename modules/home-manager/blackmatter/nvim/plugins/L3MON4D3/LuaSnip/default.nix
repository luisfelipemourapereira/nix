{ lib, config, ... }:
with lib;
let
  author = "L3MON4D3";
  name = "LuaSnip";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "b4bc24c4925aeb05fd47d2ee9b24b7f73f5d7e32";
  plugPath = ".local/share/nvim/site/pack/${author}/start/${name}";
  cfg = config.blackmatter.programs.nvim.plugins.${author}.${name};
in
{
  options.blackmatter.programs.nvim.plugins.${author}.${name}.enable =
    mkEnableOption "${author}/${name}";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file."${plugPath}".source =
        builtins.fetchGit { inherit ref rev url; };
    })
  ];
}
