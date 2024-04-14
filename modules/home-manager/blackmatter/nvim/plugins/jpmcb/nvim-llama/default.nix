{ lib, config, ... }:
with lib;
let
  author = "jpmcb";
  name = "nvim-llama";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "aaed87540a3156a3e17e53e14f7ec0fa3a21870a";
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
