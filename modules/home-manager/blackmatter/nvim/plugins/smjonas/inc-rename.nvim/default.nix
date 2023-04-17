{ lib, config, ... }:
with lib;
let
  author = "smjonas";
  name = "inc-rename.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "21c23c379342a731a0c90f226601ec0434627b26";
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
