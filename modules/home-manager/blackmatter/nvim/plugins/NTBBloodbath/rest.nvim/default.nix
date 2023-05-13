{ lib, config, ... }:
with lib;
let
  author = "NTBBloodbath";
  name = "rest.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "d8dc204e9f6fd930d9d1d709f0d19138f804431a";
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
