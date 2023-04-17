{ lib, config, ... }:
with lib;
let
  author = "idanarye";
  name = "nvim-buffls";
  url = "https://github.com/${author}/${name}";
  ref = "develop";
  rev = "9230744bdd6bb62039c1f93728316cc51970c2f0";
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
