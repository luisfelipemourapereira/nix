{
  description = "Here be systems!";

  inputs.nixpkgs.url = "github:luisfelipemourapereira/nixpkgs";
  inputs.home-manager.url = "github:luisfelipemourapereira/home-manager";
  # inputs.secrets.url =
  # "git+ssh://git@github.com/luisfelipemourapereira/nix-secrets.git?ref=main";

  outputs = { nixpkgs, home-manager, self }: {
    nixosConfigurations = {
      starkiller = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./starkiller/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luis = import ./users/luis/home.nix;
          }
        ];
      };
      vader = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./vader/configuration.nix
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
