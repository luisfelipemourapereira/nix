{

  description = "nix configurations";

  inputs = {
    dream2nix.url = github:nix-community/dream2nix?branch=main;
    nixpkgs.url = github:NixOS/nixpkgs?branch=release-22.11;
    home-manager.url = github:luisfelipemourapereira/home-manager?branch=release-22.11;
    flake-utils.url = github:numtide/flake-utils?branch=master;
    nix-darwin.url = github:LnL7/nix-darwin?branch=master;
    pythonix.url = github:Mic92/pythonix?branch=master;
    sops-nix.url = github:Mic92/sops-nix;
    nix-funcs.url = github:t3rro/nix-funcs;
    nix-pub.url = github:luisfelipemourapereira/nix-pub;
    bundix = {
      url = github:nix-community/bundix?branch=master;
      flake = false;
    };
    hydra.url = github:NixOS/hydra?branch=master;
    arion.url = github:hercules-ci/arion?branch=master;
    cauda.url = git+ssh://git@github.com/luisfelipemourapereira/cauda?ref=main;
    stitches.url = git+ssh://git@github.com/luisfelipemourapereira/stitches?ref=main;
    nixt = {
      url = github:nix-community/nixt?branch=master;
      flake = false;
    };
    nur.url = github:nix-community/nur;
  };

  outputs =
    { home-manager
    , flake-utils
    , nix-darwin
    , dream2nix
    , nix-funcs
    , pythonix
    , sops-nix
    , stitches
    , nix-pub
    , nixpkgs
    , bundix
    , hydra
    , arion
    , cauda
    , nixt
    , self
    , nur
    }@inputs:
    let
      systems =
        let
          funcs = import ./funcs;
          mkHomeConfiguration = name: node: pkgs: extraSpecialArgs:
            home-manager.lib.homeManagerConfiguration {
              inherit extraSpecialArgs pkgs;
              modules = [ users/${name}/${node}/home.nix ];
            };
          system = "x86_64-linux";

          # This instantiates nixpkgs for each system listed
          # Allowing you to configure it (e.g. allowUnfree)
          # Our configurations will use these instances
          pkgs = legacyPackages.${system};
          legacyPackages = nixpkgs.lib.genAttrs [
            "x86_64-linux"
            "x86_64-darwin"
            "aarch64-darwin"
          ]
            (system:
              import inputs.nixpkgs {
                inherit system;
                # NOTE: Using `nixpkgs.config` in your NixOS config won't work
                # Instead, you should set nixpkgs configs here
                # (https://nixos.org/manual/nixpkgs/stable/#idm140737322551056)

                config.allowUnfree = false;
                config.permittedInsecurePackages = [
                  "python2.7-pyjwt-1.7.1"
                ];

              }
            );
          stdenv = pkgs.stdenv;
          inherit (self) outputs;
          home.modules = import ./modules/home-manager;
          node.modules = import ./modules/nixos;
          specialArgs = { inherit inputs outputs stdenv; };
          extraSpecialArgs = specialArgs // { inherit pkgs; };
          localPackages = import ./pkgs specialArgs;
          home.configurations = {
            "luis@rai" =
              mkHomeConfiguration "luis" "rai" pkgs extraSpecialArgs;
            "luis@plo" =
              mkHomeConfiguration "luis" "plo" pkgs extraSpecialArgs;
            "t3rro@rai" =
              mkHomeConfiguration "t3rro" "rai" pkgs extraSpecialArgs;
            "t3rro@plo" =
              mkHomeConfiguration "t3rro" "plo" pkgs extraSpecialArgs;
          };
          node.configurations = rec {

            # coding desktop
            rai = nixpkgs.lib.nixosSystem {
              inherit system specialArgs;
              modules = [
                {
                  nixpkgs.config.permittedInsecurePackages = [
                    "python2.7-pyjwt-1.7.1"
                  ];
                }
                nodes/rai
              ];
            };

            # gaming desktop
            plo = nixpkgs.lib.nixosSystem {
              inherit system specialArgs;
              modules = [ nodes/plo ];
            };
          };


          darwin.configurations = {
            # personal macos laptop
            ani = nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit outputs;
              };
              system = "x86_64-darwin";
              modules = [
                home-manager.darwinModules.home-manager
                ./nodes/ani
              ];
            };

            cidStitchesMod = { ... }: {
              environment.systemPackages = [
                stitches.packages.aarch64-darwin.default
              ];
            };
            # work macos laptop
            cid = nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit outputs;
              };
              system = "x86_64-darwin";
              modules = [
                home-manager.darwinModules.home-manager
                ./nodes/cid
              ];
            };

          };
        in
        {
          # attach to outputs so you can access it in nixos module
          # and pass to home-manager modules called by nixos modules
          inherit specialArgs extraSpecialArgs funcs;
          packages =
            {
              x86_64-darwin =
                flake-utils.lib.flattenTree
                  localPackages;
              x86_64-linux =
                flake-utils.lib.flattenTree
                  localPackages;
            };
          homeManagerModules = home.modules;
          homeConfigurations = home.configurations;
          nixosModules = node.modules;
          nixosConfigurations = node.configurations;
          darwinConfigurations = darwin.configurations;
        };
    in
    systems;
}
