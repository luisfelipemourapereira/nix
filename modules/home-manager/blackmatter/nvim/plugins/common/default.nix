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
  ];

  config =
    mkMerge [
      (mkIf cfg.enable
        {
          # TODO: needs a valid macos build
          # TODO: turning off until a valid build
          # TODO: is created for the rust dependency
          blackmatter.programs.nvim.plugins.jcdickinson."http.nvim".enable = false;
          blackmatter.programs.nvim.plugins.nvim-lua.plenary.enable = true;
        }
      )
    ];
}
