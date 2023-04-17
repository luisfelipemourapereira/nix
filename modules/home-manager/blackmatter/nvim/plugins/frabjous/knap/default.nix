{ lib, config, ... }:
with lib;
let
  author = "frabjous";
  name = "knap";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "8c083d333b8a82421a521539eb1c450b06c90eb6";
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
