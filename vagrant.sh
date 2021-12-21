#!/usr/bin/env sh
# build it with nix
sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos
sudo nix-channel --add https://channels.nixos.org/nixpkgs-unstable nixpkgs
sudo nixos-rebuild switch --upgrade
[ -f custom-configuration.nix ] && 
  sudo cp custom-configuration.nix /etc/nixos/custom-configuration.nix
sudo nixos-rebuild switch --upgrade
# sudo /vagrant/scripts/enforce/vader.sh
