{
  description = "home user setup";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.secrets.url =
    "git+ssh://git@github.com/luisfelipemourapereira/nix-secrets.git?ref=main";

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      vader = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          # home-manager.nixosModules.home-manager
          # {
          # home-manager.useGlobalPkgs = true;
          # home-manager.useUserPackages = true;
          # home-manager.users.luis = import ../users/luis/home.nix;
          # }
        ];
      };
    };
  };
}