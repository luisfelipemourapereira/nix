{ lib, config, ... }:
with lib;
let
  author = "ldelossa";
  name = "gh.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "bc731bb53909481995ac2edb4bf6418c051fec1a";
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
