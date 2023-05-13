{ lib, config, ... }:
with lib;
let
  author = "nvim-neotest";
  name = "neotest-go";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "4e7a87967e45f2b357fd546b0b7877774191772e";
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
