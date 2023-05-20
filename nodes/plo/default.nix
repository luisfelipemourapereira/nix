{ outputs, ... }:
{
  imports = [
    outputs.nixosModules.blackmatter
    outputs.nixosModules.antimatter
  ];
  blackmatter.host = "plo";
  blackmatter.dns.enable = true;
  blackmatter.sops.enable = true;
  blackmatter.boot.plo.enable = true;
  blackmatter.users.enable = true;
  blackmatter.fonts.enable = true;
  blackmatter.global.enable = true;
  blackmatter.xserver.enable = true;
  blackmatter.display.enable = true;
  blackmatter.pipewire.enable = true;
  blackmatter.services.enable = true;
  blackmatter.packages.enable = true;
  blackmatter.programs.enable = true;
  blackmatter.networking.enable = true;
  blackmatter.hardware.plo.enable = true;
  blackmatter.virtualization.enable = true;

  antimatter.services.consul.enable = true;
  antimatter.services.nomad.enable = true;
  # TODO: remove after pinger IT does it's job
  # globalprotect-openconnect exists to service pinger
  # the pinger vpn currently does not implement a route
  # to the shared environment so we must supplament.
  networking = {
    defaultGateway = "192.168.50.1";
    useDHCP = false;
    interfaces.tun1 = {
      ipv4.routes = [{
        address = "10.160.0.0";
        prefixLength = 16;
      }];
    };
    interfaces.enp5s0 = {
      ipv4.addresses = [{
        address = "192.168.50.153";
        prefixLength = 24;
      }];
    };
  };

}
