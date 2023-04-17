{ lib, config, ... }:
with lib;
let
  author = "cuducos";
  name = "yaml.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ec53f8eabcce9ff42121ad64ff288af8d25f5010";
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
