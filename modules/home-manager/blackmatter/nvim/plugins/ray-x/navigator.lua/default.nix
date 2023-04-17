{ lib, config, ... }:
with lib;
let
  author = "ray-x";
  name = "navigator.lua";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "d88d393d09bee1dbfa1a83f288dc6171f794fa97";
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
