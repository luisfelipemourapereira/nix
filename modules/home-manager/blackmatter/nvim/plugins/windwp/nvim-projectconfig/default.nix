{ lib, config, ... }:
with lib;
let
  author = "windwp";
  name = "nvim-projectconfig";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "05fd34831e170db269d1b84597615bcdcdde930e";
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
