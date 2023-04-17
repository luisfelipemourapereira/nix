{ lib, config, ... }:
with lib;
let
  author = "zbirenbaum";
  name = "copilot.lua";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "db62371b6eac73954c194f3c8faee36cffee8135";
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
