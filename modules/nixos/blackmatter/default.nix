# TODO: move openconnect related hacks to it's own module
{ pkgs, ... }:
let
  #############################################################################
  # openconnect vars
  #############################################################################

  # systemd service to manage tun0 by luis
  # this will permit openconnect to stay in userland
  tun0 = {
    description = "create persistent tunnels owned by luis";
    wantedBy = [ "multi-user.target" ];
    script = ''
      ${pkgs.iproute}/bin/ip tuntap add name tun0 mode tun user luis
    '';
    serviceConfig = {
      RemainAfterExit = "yes";
      Type = "oneshot";
      Restart = "always";
      ExecStop = "${pkgs.iproute}/bin/ip tuntap del name tun0 mode tun";
    };
  };
  csd-wrapper-script-input = builtins.readFile ./csd-wrapper.sh;
  csd-wrapper = pkgs.writeShellScriptBin "csd-wrapper" csd-wrapper-script-input;
  pinger-vpn-connect = pkgs.writeShellScriptBin "pinger-vpn-connect" "
  #!/usr/bin/env sh
  username=$(cat /secrets/pinger/vpn/username)
  password=$(cat /secrets/pinger/vpn/password)
  echo $password | ${pkgs.openconnect}/bin/openconnect --protocol=gp --user=$username --passwd-on-stdin \"$@\" pan.corp.pinger.com
  ";
  # end openconnect vars
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

  #############################################################################
  # openconnect configs
  #############################################################################

  # create tun0 interface for luis
  # user so that openconnect can
  systemd.services.tun0 = tun0;

  # add the scripts to PATH
  environment.systemPackages = [
    pinger-vpn-connect
    csd-wrapper
  ];

  # openconnect end configs
}
