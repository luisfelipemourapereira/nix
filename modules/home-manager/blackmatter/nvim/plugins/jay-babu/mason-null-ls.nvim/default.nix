{ lib, config, ... }:
with lib;
let
  author = "jay-babu";
  name = "mason-null-ls.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "bfaa24b899233385c92364f95856e6280bddef30";
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
