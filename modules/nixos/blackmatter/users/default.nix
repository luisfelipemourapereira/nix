{ pkgs, config, outputs, lib, ... }:
with lib;
let
  cfg = config.blackmatter;
  groups = [
    # give user sudo
    "wheel"
    # access to docker daemon
    "docker"
    # access to podman
    "podman"
    # access to to kvm2
    "libvirtd"
    # user can have audio devices
    "audio"
    # user can manage brightness
    "video"

    # for sops-nix
    config.users.groups.keys.name
  ];

  nomadGroups = [
		"wheel"
		"nomad"
    "docker"
    "podman"
    "libvirtd"
  ];
in
{
  options = {
    blackmatter = {
      users.enable = mkEnableOption "blackmatter.users";
    };
  };
  config = mkMerge [
    (mkIf cfg.users.enable {
      users.mutableUsers = false;
      users.defaultUserShell = pkgs.zsh;
			programs.zsh.enable = true;

			security.sudo = {
				enable = true;
				wheelNeedsPassword = false;
				extraConfig = "%nomad ALL=(ALL) NOPASSWD:ALL";
			};

      #########################################################################
      # cloud services
      #########################################################################

      users.users.nomad = {
        uid = 1004;
        isNormalUser = true;
        isSystemUser = false;
        group = "nomad";
        extraGroups = nomadGroups;
      };

			users.groups.nomad = {
				gid = 1004;
			};

      users.users.consul = {
        uid = 1003;
        isNormalUser = true;
        isSystemUser = false;
        group = "consul";
      };

      #########################################################################
      # actual users
      #########################################################################

      # user made for sshing in and fixing things
      users.users.diagnostics = {
        uid = 1002;
        isNormalUser = true;
        passwordFile = config.sops.secrets."luis/system/password".path;
        extraGroups = groups;
      };

      users.users.t3rro = {
        uid = 1001;
        isNormalUser = true;
        passwordFile = config.sops.secrets."luis/system/password".path;
        extraGroups = groups;
      };

      users.users.luis = {
        uid = 1000;
        isNormalUser = true;
        passwordFile = config.sops.secrets."luis/system/password".path;
        extraGroups = groups;
        packages = [ pkgs.home-manager ];
      };

      #########################################################################
      # home-manager configurations
      #########################################################################

      home-manager.extraSpecialArgs = outputs.extraSpecialArgs;
      home-manager.users.t3rro =
        import ../../../../users/t3rro/${config.networking.hostName}/home.nix;
      home-manager.users.luis =
        import ../../../../users/luis/${config.networking.hostName}/home.nix;
    })
  ];
}
