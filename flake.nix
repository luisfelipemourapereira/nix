{

  description = "nix configurations";

  #############################################################################
  # inputs
  #############################################################################

  inputs = {
    dream2nix.url = github:nix-community/dream2nix?branch=main;
    # nixpkgs.url = github:NixOS/nixpkgs?branch=release-23.11;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      # url = github:drzln/home-manager?branch=release-23.11;
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = github:numtide/flake-utils?branch=master;
    nix-darwin.url = github:LnL7/nix-darwin?branch=master;
    pythonix.url = github:Mic92/pythonix?branch=master;
    sops-nix.url = github:Mic92/sops-nix;
    nix-funcs.url = github:t3rro/nix-funcs;
    bundix = {
      url = github:nix-community/bundix?branch=master;
      flake = false;
    };
    hydra.url = github:NixOS/hydra?branch=master;
    arion.url = github:hercules-ci/arion?branch=master;
    stitches.url = github:drzln/stitches?ref=main;
    nixt = {
      url = github:nix-community/nixt?branch=master;
      flake = false;
    };
    nur.url = github:nix-community/nur;
  };

  # end inputs

  #############################################################################
  # outputs
  #############################################################################

  outputs =
    { home-manager
    , flake-utils
    , nix-darwin
    , dream2nix
    , nix-funcs
    , pythonix
    , sops-nix
    , stitches
    , nixpkgs
    , bundix
    , hydra
    , arion
    , nixt
    , self
    , nur
    }@inputs:
    let
      systems =
        let
          #####################################################################
          # imports
          #####################################################################
          # import some stuff and set values

          inherit (self) outputs;
          funcs = import ./funcs;
          stdenv = pkgs.stdenv;
          home.modules = import ./modules/home-manager;
          node.modules = import ./modules/nixos;
          specialArgs = { inherit inputs outputs stdenv; };
          extraSpecialArgs = specialArgs // { inherit pkgs; };
          localPackages = import ./pkgs extraSpecialArgs;

          # end imports

          #####################################################################
          # func helpers
          #####################################################################

          # make a home configuration structure according to some rules
          mkHomeConfiguration = name: node: pkgs: extraSpecialArgs:
            home-manager.lib.homeManagerConfiguration {
              inherit extraSpecialArgs pkgs;
              modules = [ users/${name}/${node}/home.nix ];
            };

          # end func helpers
          system = "x86_64-linux";

          #####################################################################
          # configure nixpkgs
          #####################################################################

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

                config.allowUnfree = true;
              }
            );

          # end configure nixpkgs

          #####################################################################
          # home configurations
          # these are exposed to outputs
          #####################################################################

          home.configurations = {
            ###################################################################
            # ubuntu machines
            ###################################################################

            "luis@ego" =
              mkHomeConfiguration "luis" "ego" pkgs extraSpecialArgs;

            ###################################################################
            # PGR AML2
            # my personal amazon-linux 2 box for PGR
            ###################################################################

            # lucas pereira popos support

            "LILU" =
              mkHomeConfiguration "lucas" "LILU" pkgs extraSpecialArgs;

            "tupa" =
              mkHomeConfiguration "root" "tupa" pkgs extraSpecialArgs;

            "tupa-ssm-user" =
              mkHomeConfiguration "ssm-user" "tupa" pkgs extraSpecialArgs;

            # end PGR AML2

            # amazon-linux 2 box for MBG
            "burgundy" =
              mkHomeConfiguration "root" "burgundy" pkgs extraSpecialArgs;

            "luis@rai" =
              mkHomeConfiguration "luis" "rai" pkgs extraSpecialArgs;

            "ldesiqueira@rai" =
              mkHomeConfiguration "ldesiqueira" "rai" pkgs extraSpecialArgs;

            "luis@plo" =
              mkHomeConfiguration "luis" "plo" pkgs extraSpecialArgs;

            "t3rro@rai" =
              mkHomeConfiguration "t3rro" "rai" pkgs extraSpecialArgs;
            "t3rro@plo" =
              mkHomeConfiguration "t3rro" "plo" pkgs extraSpecialArgs;
          };

          # end home configurations

          #####################################################################
          # nixos configurations
          #####################################################################

          node.configurations = rec {

            # coding desktop
            rai = nixpkgs.lib.nixosSystem {
              inherit system specialArgs;
              modules = [
                nodes/rai
              ];
            };

            # gaming desktop
            plo = nixpkgs.lib.nixosSystem {
              inherit system specialArgs;
              modules = [ nodes/plo ];
            };
          };

          # end nixos configurations


          #####################################################################
          # nix-darwin configurations
          #####################################################################

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

            # TODO: module to add stitches, consider
            # TODO: making more concise
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

          # end nix-darwin configurations
        in
        {
          # attach to outputs so you can access it in nixos module
          # and pass to home-manager modules called by nixos modules
          inherit specialArgs extraSpecialArgs funcs;

          #####################################################################
          # packages
          # offered by outputs
          # access with: outputs.packages.${system}.${pname}
          #####################################################################

          packages =
            {
              x86_64-darwin =
                flake-utils.lib.flattenTree
                  localPackages;
              x86_64-linux =
                flake-utils.lib.flattenTree
                  localPackages;
              aarch64-darwin =
                flake-utils.lib.flattenTree
                  localPackages;
            };

          # end packages

          #####################################################################
          # expose to outputs
          # expose these things to nix flake show
          # also to anything that uses this flake
          # also to internal modules via outputs
          #####################################################################

          homeManagerModules = home.modules;
          homeConfigurations = home.configurations;
          nixosModules = node.modules;
          nixosConfigurations = node.configurations;
          darwinConfigurations = darwin.configurations;

          # end expose to outputs
        };
    in
    systems;
  # end outputs
}
