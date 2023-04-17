{ lib, config, ... }:
with lib;
let
  author = "jubnzv";
  name = "mdeval.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "2654caf8ecaad702b50199d18e39cff23d81e0ba";
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
