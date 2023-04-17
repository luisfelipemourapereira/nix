{ lib, config, ... }:
with lib;
let
  author = "willothy";
  name = "veil.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "ec18376953b401d784756a47df38a75ece40f3e9";
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
