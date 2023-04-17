{ lib, config, ... }:
with lib;
let
  author = "LeonHeidelbach";
  name = "trailblazer.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "8f49c735bfa3aa47bbb8fb1bd586df2a77028a92";
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
