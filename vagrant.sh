#!/usr/bin/env sh
# build it with nix
sudo nix-channel --add https://channels.nixos.org/nixos-20.09 nixos
[ -f custom-configuration.nix ] && 
  sudo cp custom-configuration.nix /etc/nixos/custom-configuration.nix
sudo nixos-rebuild switch
# sudo /vagrant/scripts/enforce/vader.sh
