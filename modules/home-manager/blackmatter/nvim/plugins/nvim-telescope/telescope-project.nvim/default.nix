{ lib, config, ... }:
with lib;
let
  author = "nvim-telescope";
  name = "telescope-project.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "7c64b181dd4e72deddcf6f319e3bf1e95b2a2f30";
  plugPath = ".local/share/nvim/site/pack/${author}/start/${name}";
  cfg = config.blackmatter.programs.nvim.plugins.${author}.${name};
in
{
  options.blackmatter.programs.nvim.plugins.${author}.${name}.enable =
    mkEnableOption "${author}/${name}";

  config = mkMerge [
    (mkIf cfg.enable {
      home.file.".local/share/nvim/site/pack/${author}/start/${name}".source =
        builtins.fetchGit {
          inherit url ref rev;
        };
    })
  ];
}
