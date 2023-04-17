{ lib, config, ... }:
with lib;
let
  author = "folke";
  name = "noice.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "f8b1a72a7bce56d9e9ed054708dc855d57dec085";
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
