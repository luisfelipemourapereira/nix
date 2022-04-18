###############################################################################
# multiple system identities here
#
# .#rio = laptop
###############################################################################

{
  description = "Use like: nixos-rebuild switch --flake '.#rio'";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.cauda.url = "git+ssh://git@github.com/luisfelipemourapereira/cauda?ref=main";
  outputs = { nixpkgs, home-manager, self, cauda }: {
    nixosConfigurations = {
      rio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit cauda; };
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
