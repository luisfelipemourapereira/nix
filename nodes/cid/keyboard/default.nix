{ config, pkgs, inputs, ... }: {
  system.keyboard = {
    remapCapsLockToEscape = true;
    enableKeyMapping = true;
  };

  system.defaults = {
    NSGlobalDomain.InitialKeyRepeat = 20;
    NSGlobalDomain.KeyRepeat = 2;
  };
}
