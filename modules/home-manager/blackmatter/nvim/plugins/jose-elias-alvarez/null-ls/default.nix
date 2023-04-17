{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugins."jose-elias-alvarez"."null-ls";
in
{
  options.blackmatter.programs.nvim.plugins."jose-elias-alvarez"."null-ls".enable = mkEnableOption "jose-elias-alvarez/null-ls";

  config = mkMerge [
    (mkIf cfg.enable {
      # handles some linting and formatting
      home.file.".local/share/nvim/site/pack/jose-elias-alvarez/start/null-ls.nvim".source =
        builtins.fetchGit {
          url = "https://github.com/jose-elias-alvarez/null-ls.nvim";
          ref = "main";
          rev = "33cfeb7a761f08e8535dca722d4b237cabadd371";
        };
    })
  ];
}
