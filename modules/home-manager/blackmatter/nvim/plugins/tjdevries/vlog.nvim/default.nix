{ lib, config, ... }:
with lib;
let
  author = "tjdevries";
  name = "vlog.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "300e43f1628935aa9fec0560f3c7c483b3d38db2";
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
