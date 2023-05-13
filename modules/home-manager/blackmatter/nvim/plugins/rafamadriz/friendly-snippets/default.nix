{ lib, config, ... }:
with lib;
let
  author = "rafamadriz";
  name = "friendly-snippets";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "1d0dac346de7c6895ac72528df3276386c6b149b";
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
