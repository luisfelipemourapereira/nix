{ lib, config, ... }:
with lib;
let
  author = "lotabout";
  name = "skim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "f9438c390d5e66592e67a9b22fba4e5642b71ffd";
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
