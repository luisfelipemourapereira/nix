{ lib, config, ... }:
with lib;
let
  author = "LudoPinelli";
  name = "comment-box.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "6672213bd5d2625a666a297b66307967effa50bc";
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
