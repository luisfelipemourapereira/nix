{ lib, config, ... }:
with lib;
let
  author = "MunifTanjim";
  name = "nui.nvim";
  url = "https://github.com/${author}/${name}";
  ref = "main";
  rev = "0dc148c6ec06577fcf06cbab3b7dac96d48ba6be";
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
