{ lib, config, ... }:
with lib;
let
  author = "declancm";
  name = "cinnamon.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "c406ffda3a0302f32c23b24ab756ea20467d6578";
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
