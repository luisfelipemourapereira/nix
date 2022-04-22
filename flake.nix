###############################################################################
# multiple system identities here
#
# .#rio = laptop
###############################################################################

{
  description = "Use like: nixos-rebuild switch --flake '.#rio'";
  # has ruby-2.4.4
  inputs.nixpkgs.url = "github:luisfelipemourapereira/nixpkgs?ref=2fbe71019a1fd7c616586499051c95721c700777";
  inputs.home-manager.url = "github:nix-community/home-manager?ref=742c6cb3e9d866e095c629162fe5faf519adeb26";
  inputs.cauda.url = "git+ssh://git@github.com/luisfelipemourapereira/cauda?ref=main";
  inputs.nix-secrets.url = "git+ssh://git@github.com/luisfelipemourapereira/nix-secrets?ref=main";
  outputs = { nixpkgs, home-manager, self, cauda, nix-secrets }: rec {
    nixosConfigurations = rec {
      rio = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit cauda nix-secrets; };
        modules = [
          ./nodes/rio/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luis = import ./users/luis/home.nix;
          }
          nix-secrets.nixosModule
        ];
      };
    };
  };
}
