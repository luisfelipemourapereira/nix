{ lib, config, ... }:
with lib;
let
  author = "kosayoda";
  name = "nvim-lightbulb";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "56b9ce31ec9d09d560fe8787c0920f76bc208297";
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
