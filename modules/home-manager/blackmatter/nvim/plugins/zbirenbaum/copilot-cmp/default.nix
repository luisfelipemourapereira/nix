{ lib, config, ... }:
with lib;
let
  author = "zbirenbaum";
  name = "copilot-cmp";
  url = "https://github.com/${author}/${name}";
  ref = "master";
  rev = "92535dfd9c430b49ca7d9a7da336c5db65826b65";
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
