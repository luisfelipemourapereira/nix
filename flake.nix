###############################################################################
# multiple system identities here
#
# .#rio = laptop
###############################################################################

{
  description = "Use like: nixos-rebuild switch --flake '.#rio'";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.local.url = "path:./derivations";
  outputs = { nixpkgs, home-manager, self, local }: {
    nixosConfigurations = {
      rio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nodes/rio/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luis = import ./users/luis/home.nix;
          }
        ];
      };
    };
  };
}
