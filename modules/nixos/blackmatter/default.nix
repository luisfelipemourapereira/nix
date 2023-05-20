{ pkgs, ... }:
let
  csd-wrapper = pkgs.writeshellScriptBin "csd-wrapper" builtins.readFile ./csd-wrapper.sh;
  pinger-vpn-connect = pkgs.writeShellScriptBin "pinger-vpn-connect" "
  #!/usr/bin/env sh
  username=$(cat /secrets/pinger/vpn/username)
  password=$(cat /secrets/pinger/vpn/password)
  echo $password | sudo ${pkgs.openconnect}/bin/openconnect --protocol=gp --user=$username --passwd-on-stdin \"$@\" --csd-wrapper=$(which csd-wrapper) pan.corp.pinger.com
  ";
in
{
  imports = [
    ./virtualization
    ./networking
    ./pipewire
    ./services
    ./programs
    ./packages
    ./hardware
    ./xserver
    ./global
    ./kanshi
    ./fonts
    ./users
    ./boot
    ./sops
    ./dns
  ];
  environment.systemPackages = [ 
    pinger-vpn-connect 
    csd-wrapper
  ];

  # services.globalprotect = {
  #   enable = true;
  #   settings = {
  #     "pan.corp.pinger.com" = {
  #       openconnect-args = ''
  #         #!/usr/bin/env sh
  #         username=$(cat /secrets/pinger/vpn/username)
  #         password=$(cat /secrets/pinger/vpn/password)
  #       '';
  #     };
  #   };
  # };
}
