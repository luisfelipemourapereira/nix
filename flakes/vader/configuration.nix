{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./enableFlakes.nix
      ./identity.nix
    ];

  system.stateVersion = "21.05"; # Did you read the comment?
}

