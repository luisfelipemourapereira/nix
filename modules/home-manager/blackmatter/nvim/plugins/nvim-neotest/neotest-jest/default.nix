{ lib, config, ... }:
with lib;
let
  author = "nvim-neotest";
  name = "neotest-jest";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "22b1050dda3ebd401780ec4b8e193cf52523a4da";
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
