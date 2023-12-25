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
        environment.systemPackages =
          with pkgs;
          with inputs;
          [
            globalprotect-openconnect
            # fcitx5-configtool
            # docker-client
            traceroute
            # use tfswitch to load terraform binary
            # terraform
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
            # fcitx5
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
      })
    ];
}
