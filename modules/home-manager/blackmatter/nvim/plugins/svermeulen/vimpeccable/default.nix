{ lib, config, ... }:
with lib;
let
  author = "svermeulen";
  name = "vimpeccable";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "bd19b2a86a3d4a0ee184412aa3edb7ed57025d56";
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
