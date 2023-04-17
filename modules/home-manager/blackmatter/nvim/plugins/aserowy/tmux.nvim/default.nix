{ lib, config, ... }:
with lib;
let
  author = "aserowy";
  name = "tmux.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "9ba03cc5dfb30f1dc9eb50d0796dfdd52c5f454e";
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
