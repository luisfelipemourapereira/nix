{ config, pkgs, ... }:

{
  imports = [ ./enableFlakes.nix ./identity.nix ];

  system.stateVersion = "21.05"; # Did you read the comment?
}

