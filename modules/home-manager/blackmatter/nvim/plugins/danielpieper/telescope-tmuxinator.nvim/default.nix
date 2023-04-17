{ lib, config, ... }:
with lib;
let
  author = "danielpieper";
  name = "telescope-tmuxinator.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "9b51e2dc870c46aa57e277bb70b2c1c000a7a857";
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
