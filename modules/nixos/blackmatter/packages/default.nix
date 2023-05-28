{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  options = {
    blackmatter = {
      packages.enable = mkEnableOption "packages";
    };
  };

  config =
    mkMerge [
      (mkIf cfg.packages.enable {
        # There are two strategies for dealing with unfree packages
        # You can either generally allow unfree packages or white-list
        # them.  I have chosen to white-list.
        # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        #   "ssm-session-manager-plugin"
        #   "spotify-unwrapped"
        #   "nvidia-settings"
        #   "1password-cli"
        #   "nvidia-x11"
        #   "1password"
        #   "discord"
        #   "spotify"
        #   "slack"
        #   "zoom"
        # ];

        environment.systemPackages =
          with pkgs;
          with inputs;
          [
            globalprotect-openconnect
            fcitx5-configtool
            # docker-client
            traceroute
            terraform
            # comes up as undefined
            # pkgconfig
            nix-index
            drm_info
            pciutils
            tfswitch
            yarn2nix
            starship
            dnsmasq
            ripgrep
            weechat
            gnumake
            openssh
            fcitx5
            nodejs
            # TODO: poetry is flagged as insecure
            # poetry
            bundix
            cargo
            arion
            unzip
            gnupg
            lorri
            nomad
            vault
            ruby
            sddm
            sway
            rofi
            yarn
            xsel
            lshw
            htop
            nmap
            stow
            zlib
            wget
            curl
            gcc
            age
            git
            fzf
            dig
            vim
            vim
            git
            gh
          ];

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

        # nixpkgs.config.permittedInsecurePackages = [
        #   "python2.7-certifi-2021.10.8"
        #   "python2.7-pyjwt-1.7.1"
        #   "python-2.7.18.6"
        # ];
      })
    ];
}
