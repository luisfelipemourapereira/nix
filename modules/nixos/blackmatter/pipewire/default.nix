{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      pipewire.enable = mkEnableOption "pipewire";
    };
  };
  config =
    mkMerge [
      (mkIf cfg.pipewire.enable {
        services.pipewire = {
          enable = true;

          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;

          # TODO: remove this nix migration is complete
          # media-session.config.bluez-monitor.rules = [
          #   {
          #     # Matches all cards
          #     matches = [{ "device.name" = "~bluez_card.*"; }];
          #     actions = {
          #       "update-props" = {
          #         "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
          #         # mSBC is not expected to work on all headset + adapter combinations.
          #         "bluez5.msbc-support" = true;
          #         # SBC-XQ is not expected to work on all headset + adapter combinations.
          #         "bluez5.sbc-xq-support" = true;
          #       };
          #     };
          #   }
          #   {
          #     matches = [
          #       # Matches all sources
          #       { "node.name" = "~bluez_input.*"; }
          #       # Matches all outputs
          #       { "node.name" = "~bluez_output.*"; }
          #     ];
          #   }
          # ];

          # TODO: remove this nix migration is complete
          # config.pipewire = {
          #   "link.max-buffers" = 64;
          #   "log.level" = 2;
          #   "default.clock.rate" = 48000;
          #   "default.clock.quantum" = 1024;
          #   "default.clock.min-quantum" = 32;
          #   "default.clock.max-quantum" = 8192;
          # };
        };
      })
    ];
}
