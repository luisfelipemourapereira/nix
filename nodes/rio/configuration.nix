# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password"
    "1password-cli"
    "slack"
    "spotify"
    "spotify-unwrapped"
  ];
  
  # zsh as the default shell
  users.defaultUserShell = pkgs.zsh;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rio"; # Define your hostname.
  # Enables wireless support via wpa_supplicant.
  # enable if you are not using network-manager
  #networking.wireless.enable = true;
  #networking.wireless.interfaces = [ "wlp0s20f3" ];
  #networking.wireless.networks = {
  #  Drizzlin = {
  #    pskRaw =
  #      "d937d8e5b4e5593b19962c83b4b3e2407be3b2073ec6ca5ea64fe1efe8c52d47";
  #    priority = 0;
  #  };
  #};

  # fonts
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp41s0.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

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
  services.xserver.enable = true;
  # services.xserver.xkbOptions = "caps:escape";


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.mutableUsers = false;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luis = {
    isNormalUser = true;
    hashedPassword = "$6$4k6ZEsBqkvd5CM86$dDm8optLRzThRk5VBobPWsMh5YmG1ep2n.myvA06a9R22DwyKZr4hxRCO5KghxazAzRPjTvfNK9c4d4VEKoWR/"; 
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     firefox
     _1password
     _1password-gui
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     curl
     git
     slack
     spotify
  ];

  # session variables
  # # turn on wayland for slack
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # turn on screensharing for slack
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        #xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  # if you start from desktop nixOS these will be installed by default
  # remove them if they exist.
  environment.gnome.excludePackages = [
    pkgs.gnome.gnome-characters
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gnome-music
    pkgs.gnome.epiphany
    pkgs.gnome.evince
    pkgs.gnome.cheese
    pkgs.gnome-photos
    pkgs.gnome.hitori
    pkgs.gnome.atomix
    pkgs.gnome.gedit
    pkgs.gnome.totem
    pkgs.gnome.iagno
    pkgs.gnome.geary
    pkgs.gnome.tali
    pkgs.gnome-tour
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
  # services.openssh.enable = true;

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
  system.stateVersion = "21.11"; # Did you read the comment?

}

