{ lib, config, ... }:
with lib;
let
  author = "ravenxrz";
  name = "DAPInstall.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "92f03b9786bed8f01ae5d78645b480ac3cc8eb31";
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
