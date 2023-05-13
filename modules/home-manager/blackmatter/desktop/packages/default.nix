{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      desktop.packages.enable = mkEnableOption "desktop.packages";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.packages.enable {
      # overlay the discord-canary package
      # to install openasar https://openasar.dev/
      nixpkgs.overlays =
        let
          openasar = self: super: {
            discord-canary = super.discord.override { withOpenASAR = true; };
          };
        in
        [ openasar ];

      home.packages = with pkgs;[
        gnome3.gnome-tweaks
        _1password-gui-beta
        _1password
        fractal
        blender
        spotify
        leftwm
        slack
        zoom-us
        kitty
        discord-canary
        # exists but build is broken
        # it may be fixed later
        # retroshare
        obsidian
        xdotool
        xtitle
      ];

      # There are two strategies for dealing with unfree packages
      # You can either generally allow unfree packages or white-list
      # them.  I have chosen to white-list.
      nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "ssm-session-manager-plugin"
        "spotify-unwrapped"
        "nvidia-settings"
        "1password-cli"
        "nvidia-x11"
        "1password"
        "obsidian"
        "discord-canary"
        "discord"
        "spotify"
        "slack"
        "zoom"
      ];
    })
  ];
}
