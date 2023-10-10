{ lib, config, ... }:
with lib;
let
  author = "godlygeek";
  name = "tabular";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "339091ac4dd1f17e225fe7d57b48aff55f99b23a";
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
