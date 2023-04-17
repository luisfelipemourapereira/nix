{ lib, config, ... }:
with lib;
let
  author = "Wansmer";
  name = "treesj";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "29aac56d24bf9870f2ea337817c5542b56e21f16";
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
