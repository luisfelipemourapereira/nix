{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      xserver.enable = mkEnableOption "xserver";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.xserver.enable {
        # TODO: finish NVIDIA configuration that gives you 360hz refresh rate
        # environment.etc."X11/xorg.conf".text =
        #   ''
        #     Section "Monitor"
        #       Identifier   "DP-2"
        #       Modeline     "1920x1080_360.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
        #       Option       "PreferredMode" "1920x1080_360.00"
        #     EndSection
        #
        #     Section "Screen"
        #       Identifier "Screen 0"
        #       Device     "MainMonitor"
        #       Monitor    "DP-2"
        #       DefaultDepth    24
        #       SubSection "Display"
        #       Depth       24
        #       Modes      "1920x1080_360.00"
        #       EndSubSection
        #     EndSection
        #   '';
        services.xserver = {
          enable = true;
          layout = "us";
          autoRepeatDelay = 135;
          autoRepeatInterval = 40;
          videoDrivers = [ "nvidia" "intel" "nouveau" "qxl" "amdgpu" ];
          xkbOptions = "caps:escape";
          libinput = { enable = true; };
          displayManager = {
            # defaultSession = "none+i3";
            defaultSession = "none+leftwm";
            sddm = {
              enable = true;
              theme = "nord";
            };
            lightdm = {
              enable = false;
            };
            gdm = {
              enable = false;
              wayland = false;
            };
          };
          desktopManager = {
            gnome = {
              enable = false;
            };
            xterm = {
              enable = false;
            };
          };
          windowManager = {
            leftwm = { enable = true; };
            i3 = {
              enable = false;
              extraPackages = with pkgs; [
                i3blocks
                i3status
                i3lock
                dmenu
              ];
            };
          };
        };
      })
    ];
}
