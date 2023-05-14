{ lib, config, ... }:
with lib;
let
  author = "danymat";
  name = "neogen";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "c0fd3dc9e7cc91181ea5a345c4b01c865626c81e";
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
