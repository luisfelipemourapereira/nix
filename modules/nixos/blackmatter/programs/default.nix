{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      programs.enable = mkEnableOption "programs";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.programs.enable {
        appstream.enable = false;
        programs.sway.enable = true;
        # programs.sway.extraOptions = [ "--unsupported-gpu" ];
        # programs.sway.wrapperFeatures.gtk = true;
        # programs held aside
        # flashfocus
        programs.sway.extraPackages = with pkgs; [
          i3-ratiosplit
          wl-clipboard
          wf-recorder
          autotiling
          gammastep
          swaylock
          swayidle
          clipman
          waybar
          dmenu
          wofi
          mako
        ];
        # sway systemd integration
        # https://nixos.wiki/wiki/Sway
        systemd.user.targets.sway-session = {
          description = "Sway compositor session";
          documentation = [ "man:systemd.special(7)" ];
          bindsTo = [ "graphical-session.target" ];
          wants = [ "graphical-session-pre.target" ];
          after = [ "graphical-session-pre.target" ];
        };

        xdg = {
          portal = {
            enable = true;
            extraPortals = with pkgs; [
              xdg-desktop-portal-wlr
            ];
          };
        };
      })
    ];
}
