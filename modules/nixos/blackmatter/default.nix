{ pkgs, ... }: {
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
  services.globalprotect = {
    enable = true;
    settings = {
      "pan.corp.pinger.com" = {
        openconnect-args = ''/secrets/pinger/vpn.sh'';
      };
    };
  };
}
