{ lib, config, ... }:
with lib;
let
  author = "ThePrimeagen";
  name = "refactoring.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "47a1716a9020c0093a1c8af36c3f9434dae62bbd";
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
