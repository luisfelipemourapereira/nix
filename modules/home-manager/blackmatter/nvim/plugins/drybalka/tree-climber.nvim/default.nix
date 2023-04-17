{ lib, config, ... }:
with lib;
let
  author = "drybalka";
  name = "tree-climber.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "9b0c8c8358f575f924008945c74fd4f40d814cd7";
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
