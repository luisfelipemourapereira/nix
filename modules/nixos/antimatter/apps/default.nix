{ lib, config, ... }:
with lib;
let
  cfg = config.antimatter.apps;
in
{
  options = {
    antimatter = {
      apps = {
        enable = mkEnableOption "antimatter.apps";
      };
    };
  };
}
