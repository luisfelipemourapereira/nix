{ lib, config, ... }:
with lib;
let
  author = "Pocco81";
  name = "dap-buddy.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "bbda2b062e5519cde4e10b6e4240d3dd1f867b20";
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
