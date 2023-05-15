{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim.plugin.groups.common;
  plugs = config.blackmatter.programs.nvim.plugins;
in
{
  options.blackmatter.programs.programs.nvim.plugin.groups.common =
    {
      enable = mkEnableOption "common";
    };

  imports = [
    ./plugin/jcdickinson/http.nvim
    ./plugin/nvim-lua/plenary
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      # TODO: needs a valid macos build
      # TODO: turning off until a valid build
      # TODO: is created for the rust dependency
      plugs.jcdickinson."http.nvim".enable = false;
      plugs.nvim-lua.plenary.enable = true;
    })
  ];
}
