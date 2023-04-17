{ lib, config, ... }:
with lib;
let
  cfg = config.antimatter.containers;
in
{
  options = {
    antimatter = {
      containers = {
        enable = mkEnableOption "antimatter.containers";
      };
    };
  };
}
