{ lib, config, ... }:
with lib;
let
  author = "rafcamlet";
  name = "tabline-framework.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "f0d229cc2c103bbc356d26c928eff02be40b230f";
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
