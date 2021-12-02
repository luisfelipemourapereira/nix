# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./enableFlakes.nix
    ];

  # exclude extra gnome packages
  environment.gnome.excludePackages = [
    pkgs.gnome.gnome-characters
    pkgs.gnome.gnome-calculator
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gnome-contacts
    pkgs.gnome.gnome-calendar
    pkgs.gnome.gnome-clocks
    pkgs.gnome.gnome-music
    pkgs.gnome.simple-scan
    pkgs.gnome.gnome-maps
    pkgs.gnome.gnome-logs
    pkgs.gnome.cheese
    pkgs.gnome-photos
    pkgs.gnome.atomix
    pkgs.gnome.hitori
    pkgs.gnome.gedit
    pkgs.gnome.totem
    pkgs.gnome.geary
    pkgs.gnome.iagno
    pkgs.gnome.tali
    pkgs.gnome-tour
    pkgs.epiphany
    pkgs.evince
  ];

  # sway to use with wayland
  programs.sway = {
    enable = false;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako # notification daemon
      alacritty # Alacritty is the default terminal in the config
      dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
  };

  # obtain nightly neovim build
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
      sha256 = "03ayjfrxrv4hiy7z491gzaqx0382nn04bw7wlvin02xppwdhra4z";
    }))
  ];

  # assign hostname
  networking.hostName = "starkiller";

  # allow unfree stuff like nvidia
  nixpkgs.config.allowUnfree = true;

  # enable wireless via wpa_supplicant
  networking.wireless.enable = true;
  networking.wireless.interfaces = ["wlp0s20f3"];
  networking.wireless.networks = {
    Drizzlin = {
      pskRaw = "d937d8e5b4e5593b19962c83b4b3e2407be3b2073ec6ca5ea64fe1efe8c52d47";
      priority = 0;
    };
  };

  # enable wireless via networkmanager
  networking.networkmanager.enable = false;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Set your time zone.
  # time.timeZone = "Unset";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp40s0.useDHCP = true;
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

  # hardware.nvidia.modesetting.enable = true;
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkbOptions = "caps:escape";
    videoDrivers = ["nvidia"];
    desktopManager = {
      gnome.enable = true;
      plasma5 = {
        enable = false;
      };
      xterm.enable = false;
    };
    displayManager = {
      gdm.enable = true;
      #lightdm = {
      #  enable = false;
      #};
      # defaultSession = "none+i3";
      # defaultSession = "plasma5+i3";
      # defaultSession = "plasma5";
      # defaultSession = "sway";
      defaultSession = "gnome";
    };
    windowManager.i3 = {
      enable = false;
      #extraPackages = with pkgs; [
      #  dmenu
      #  i3status
      #  i3lock
      #  # i3blocks
      #];
    };
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luis = {
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLhg86QwXk4y65DsabycSWIaa6dA2ArRnOLuMwtXnG/RyHYp7KbyESHtMmidE7wACHShYbN7kUU9RxOwq1jS73ClEEe2WtsSz4T5lcVl0/mSCSg1auPNaGUI2HQ3unG50adVpNh4WHfxJR12jGuwLxa4ZINtz8V5qN5mH2cnqaMkY7fm7/R7ik6S8bFK4B10hFHjdyDTGS+xJWEknNlfn7vtuvj1QSJt2xB1PHvsCS4NZdYGPkOESK9H2RQNnXN6Soi+ySIJlpO+z9ovIeGJd0kASg6Lyq9GuyYAOv/RQFHKCtCe/ow10AwuirUk2guQpo88ORNLj06KTknkzjMHQMb4mB6fTPvhE2dm0EByeglIJIATWAwCbAyisY5pk7Effc98b/hs5x+OR5XO1Tjo6v+doL0rTHB79Q7/oxr3WK+JjlLpSRJVR0A4RqYQEUic/a7GFFE5ZBxF9pdcnLneW8CkNbztCY7QxsxnMOfwZCLTAIj95iKeXLvvABB2iSXy8= luis@ani"
    ];
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  security.sudo.wheelNeedsPassword = false;

  # zsh is the default shell
  users.defaultUserShell = pkgs.zsh;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #(pkgs.writeShellScriptBin "nixFlakes" ''
    #  exec ${pkgs.nixFlakes}/bin/nix --experimental-features "nix-command flakes" "$@"
    #'')
    zsh
    vim
    git
    neovim
    firefox
    pciutils
    alacritty
    # lutris-free
    google-chrome
    gnome.gnome-tweaks
    # wineWowPackages.staging
    # (winetricks.override { wine = wineWowPackages.staging; })
  ];

  # set terminal envvar
  # environment.sessionVariables.TERMINAL = [ "alacritty" ];

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
  services.openssh.passwordAuthentication = false;
  services.openssh.permitRootLogin = "no";
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
