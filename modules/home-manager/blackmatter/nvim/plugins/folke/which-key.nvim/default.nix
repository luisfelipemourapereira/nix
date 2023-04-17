{ lib, config, ... }:
with lib;
let
  author = "folke";
  name = "which-key.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "87b1459b3e0be0340da2183fc4ec8a00b2960678";
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
