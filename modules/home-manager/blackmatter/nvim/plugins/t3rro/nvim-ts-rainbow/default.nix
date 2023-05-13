{ lib, config, ... }:
with lib;
let
  author = "t3rro";
  name = "nvim-ts-rainbow";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "ef95c15a935f97c65a80e48e12fe72d49aacf9b9";
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
