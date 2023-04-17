{ lib, config, ... }:
with lib;
let
  author = "sudormrfbin";
  name = "cheatsheet.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "9716f9aaa94dd1fd6ce59b5aae0e5f25e2a463ef";
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
