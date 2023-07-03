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
      #########################################################################
      # discord
      #########################################################################

      # overlay the discord-canary package
      # to install openasar https://openasar.dev/
      nixpkgs.overlays =
        let
          openasar = self: super: {
            discord-canary = super.discord.override { withOpenASAR = true; };
          };
        in
        [ openasar ];

      xdg.configFile."discordcanary/settings.json".text = "{\"SKIP_HOST_UPDATE\": true }";
      # end discord

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
        webcamoid
        # exists but build is broken
        # it may be fixed later
        # retroshare
        obsidian
        xdotool
        xtitle
        freecad
      ];
    })
  ];
}
