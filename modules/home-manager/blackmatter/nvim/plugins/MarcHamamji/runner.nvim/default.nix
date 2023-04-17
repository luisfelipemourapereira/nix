{ lib, config, ... }:
with lib;
let
  author = "MarcHamamji";
  name = "runner.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "a5a437eb11e3f34bbdd15a0de6eb073ac4cd9ae2";
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
