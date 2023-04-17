{ lib, config, ... }:
with lib;
let
  author = "ms-jpq";
  name = "chadtree";
  url = "https://github.com/${author}/${name}";
  ref = "chad";
  rev = "773fb772e43b10d407133079e5ef2c69bda3ed8b";
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
