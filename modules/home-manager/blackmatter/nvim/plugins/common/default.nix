{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.common;
in
{
  options.blackmatter.programs.nvim.plugin.groups.common =
    {
      enable = mkEnableOption "common";
    };

  imports = [
    ../jcdickinson/http.nvim
    ../nvim-lua/plenary
    ../folke/which-key.nvim
    ../folke/neodev.nvim
    ../maaslalani/nordbuddy
    ../numToStr/Comment
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          # TODO: needs a valid macos build
          # TODO: turning off until a valid build
          # TODO: is created for the rust dependency
          blackmatter.programs.nvim.plugins =
            {
              numToStr.Comment.enable = true;
              jcdickinson."http.nvim".enable = false;
              maaslalani.nordbuddy.enable = true;
              nvim-lua.plenary.enable = true;
              folke."which-key.nvim".enable = true;
              folke."neodev.nvim".enable = true;
            };
        }
      )
    ];
}
