{ lib, config, ... }:
with lib;
let
  author = "kcl-lang";
  name = "kcl.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "d9a96c1b3067234fb452413687338890aa8f70bc";
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

