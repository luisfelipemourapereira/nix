# nix

nixosConfigurations

-- each system name is a hook for running
-- nix flakes '.#systemName' and therefore
-- a different system.
attr {
 systemName = nixpkgs.lib.nixosSystem {}
 systemName = nixpkgs.lib.nixosSystem {}
}

-- defines a single nixosSystem which is composed of modules
-- and seemingly a hint of the type of system which seems linux is
-- $ARCH-linux like x86_64-linux
-- https://nixos.wiki/wiki/Module
nixosSystem {}
