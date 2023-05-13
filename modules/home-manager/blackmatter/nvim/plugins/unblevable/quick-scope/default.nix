{ lib, config, ... }:
with lib;
let
  author = "unblevable";
  name = "quick-scope";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "a147fe0b180479249a6770eac332e2cd8f35b673";
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
