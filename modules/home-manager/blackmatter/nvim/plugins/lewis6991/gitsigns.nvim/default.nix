{ lib, config, ... }:
with lib;
let
  author = "lewis6991";
  name = "gitsigns.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ca473e28382f1524aa3d2b6f04bcf54f2e6a64cb";
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
