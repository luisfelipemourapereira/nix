{ lib, config, ... }:
with lib;
let
  author = "miversen33";
  name = "netman.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "0992ecede84db9591c59ee2131f39443f4a44f3c";
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
