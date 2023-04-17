{ lib, config, ... }:
with lib;
let
  author = "nanotee";
  name = "nvim-lsp-basics";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "632714bd3ab355eb6e725b5a78cd8730f12d14d2";
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
