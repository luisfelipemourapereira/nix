{ lib, config, ... }:
with lib;
let
  author = "ibhagwan";
  name = "fzf-lua";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "79a74aebab4cd5fca460c61dc47e5e1d7a54b01e";
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
