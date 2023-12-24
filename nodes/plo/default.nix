{ outputs, pkgs, lib, ... }:
{
  imports = [
    outputs.nixosModules.blackmatter
    outputs.nixosModules.antimatter
    ./insecure
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.permittedInsecurePackages =
    [
      "python2.7-pyjwt-1.7.1"
      "electron-25.9.0"
    ];

  blackmatter.host = "plo";
  blackmatter.dns.enable = true;
  blackmatter.sops.enable = true;
  blackmatter.boot.plo.enable = true;
  blackmatter.users.enable = true;
  blackmatter.fonts.enable = true;
  blackmatter.global.enable = true;
  blackmatter.services.enable = true;
  blackmatter.packages.enable = true;
  blackmatter.programs.enable = true;
  blackmatter.hardware.plo.enable = true;

  # audio
  blackmatter.pipewire.enable = true;

  # network
  blackmatter.networking.enable = true;

  # virtualization
  blackmatter.virtualization.enable = true;

  # GUI
  blackmatter.xserver.enable = true;
  blackmatter.display.enable = true;

  antimatter.services.consul.enable = true;
  antimatter.services.nomad.enable = true;

  # TODO: remove after pinger IT does it's job
  # globalprotect-openconnect exists to service pinger
  # the pinger vpn currently does not implement a route
  # to the shared environment so we must supplament.
  networking = {
    defaultGateway = "192.168.50.1";
    useDHCP = false;
    # interfaces.tun0 = {
    #   ipv4.routes = [{
    #     address = "10.160.0.0";
    #     prefixLength = 16;
    #   }];
    # };
    interfaces.enp5s0 = {
      ipv4.addresses = [{
        address = "192.168.50.153";
        prefixLength = 24;
      }];
    };
  };

  # TODO: remove after you refactor pinger-apps and pinger-iac
  # TODO: to have more portable shell scripting
  # shell scripting in these repositories has a whole lot of 
  # /bin/bash without using env to find the correct interpreter
  # so this is to hack around that for now until pinger-apps and pinger-iac
  # can be fixed.
  environment.systemPackages = [ pkgs.bash ];

  nixpkgs.config.fileSystems."/bin/bash" = {
    source = "${pkgs.bash}/bin/bash";
    symlink = true;
  };

  # systemd.services.create-bash-symlink = {
  #   description = "Create symlink for /bin/bash";
  #   wantedBy = [ "multi-user.target" ];
  #   script = ''
  #     ! [ -e /bin/bash ] && ln -sf ${pkgs.bash}/bin/bash /bin/bash
  #   '';
  #   serviceConfig = {
  #     RemainAfterExit = "yes";
  #     Type = "oneshot";
  #   };
  # };
}
