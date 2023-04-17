{ lib, config, ... }:
with lib;
let
  author = "NTBBloodbath";
  name = "galaxyline.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "4d4f5fc8e20a10824117e5beea7ec6e445466a8f";
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
