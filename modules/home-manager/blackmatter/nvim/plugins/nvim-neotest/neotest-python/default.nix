{ lib, config, ... }:
with lib;
let
  author = "nvim-neotest";
  name = "neotest-python";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "6c06041cfb45f45e276068020baa06c06fe20d5c";
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
