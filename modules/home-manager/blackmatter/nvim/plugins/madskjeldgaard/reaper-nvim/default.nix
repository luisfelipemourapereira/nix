{ lib, config, ... }:
with lib;
let
  author = "madskjeldgaard";
  name = "reaper-nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "dc30b618bb0e2c47b7e0dce781527627291b3365";
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
