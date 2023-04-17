{ lib, config, ... }:
with lib;
let
  author = "numToStr";
  name = "Navigator.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "91d86506ac2a039504d5205d32a1d4bc7aa57072";
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
