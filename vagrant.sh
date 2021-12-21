#!/usr/bin/env sh
# build it with nix
sudo nix-channel --add https://channels.nixos.org/nixos-unstable
sudo nix-channel --add https://channels.nixos.org/nixpkgs-unstable
[ -f custom-configuration.nix ] && 
  sudo cp custom-configuration.nix /etc/nixos/custom-configuration.nix
sudo nixos-rebuild switch
# sudo /vagrant/scripts/enforce/vader.sh
