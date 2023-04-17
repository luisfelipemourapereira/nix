{ lib, config, ... }:
with lib;
let
  author = "gennaro-tedesco";
  name = "nvim-possession";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "b97ad11fb91e555f6cb4edc996a4bbdeeefa8baa";
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
