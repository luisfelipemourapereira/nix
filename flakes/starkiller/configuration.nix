{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./enableFlakes.nix
    ];
  
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sdb"; # or "nodev" for efi only
  networking.hostName = "starkiller"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.eno2.useDHCP = true;
  networking.interfaces.eno3.useDHCP = true;
  networking.interfaces.eno4.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.defaultUserShell = pkgs.zsh;
  users.users.luis = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLhg86QwXk4y65DsabycSWIaa6dA2ArRnOLuMwtXnG/RyHYp7KbyESHtMmidE
7wACHShYbN7kUU9RxOwq1jS73ClEEe2WtsSz4T5lcVl0/mSCSg1auPNaGUI2HQ3unG50adVpNh4WHfxJR12jGuwLxa4ZINtz8V5qN5mH2cnqaMkY7fm7/R7ik6S8bFK4B10hFHjdyDTGS+xJWEknNlfn7vtuvj1QSJt2xB1PHvsCS4NZdYGPkOESK9H2RQNnXN6Soi+ySIJlpO+z9ovIeGJd0kASg6Lyq9GuyYAOv/RQFHKCtCe/ow10AwuirUk2guQpo88ORNLj06KTknkzjMHQMb4mB6fTPvhE2dm0EByeglIJIATWAwCbAyisY5pk7Effc98b/hs5x+OR5XO1Tjo6v+doL0rTHB79Q7/oxr3WK+JjlLpSRJVR0A4RqYQEUic/a7GFFE5ZBxF9pdcnLneW8CkNbztCY7QxsxnMOfwZCLTAIj95iKeXLvvABB2iSXy8= luis@ani"
    ];
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  security.sudo.wheelNeedsPassword = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = true;
  services.openssh.permitRootLogin = "yes";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

