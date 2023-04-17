{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      services.enable = mkEnableOption "services";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.services.enable {
        security.rtkit.enable = true;
        services.blueman.enable = true;
        services.printing.enable = false;
        services.hardware.bolt.enable = false;
        services.nfs.server.enable = false;
        services.openssh = {
          enable = true;
          settings = {
            passwordAuthentication = false;
            kbdInteractiveAuthentication = false;
            permitRootLogin = "no";
          };
        };
        services.hydra = {
          enable = false;
          hydraURL = "http://localhost:3000";
          notificationSender = "hydra@localhost";
          buildMachinesFiles = [ ];
          useSubstitutes = true;
        };
        services.greetd.enable = false;
        services.greetd.settings = {
          default_session = {
            command = "agreety --cmd /bin/sh";
            user = "greeter";
          };
        };
        environment.etc."greetd/sway-config".text = ''
          exec "wlgreet --command sway; swaymsg exit"

          bindsym Mod4+shift+e exec swaynag \
          	-t warning \
          	-m 'What do you want to do?' \
          	-b 'Poweroff' 'systemctl poweroff' \
          	-b 'Reboot' 'systemctl reboot'

          # include /etc/sway/config.d/*
        '';
        # https://nixos.wiki/wiki/Storage_optimization
        nix.settings.auto-optimise-store = true;
        nix.gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
        nix.extraOptions = ''
          min-free = ${toString (1024 * 1024 * 1024)}
          max-free = ${toString (4096 * 1024 * 1024)}
        '';
      })
    ];
}
