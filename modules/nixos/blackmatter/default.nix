{ ... }: {
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
  services.globalprotect.enable = true;
}
