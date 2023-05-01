# ani is macos ventura
# https://daiderd.com/nix-darwin/manual/index.html#sec-options
{ config, pkgs, inputs, ... }:
let
  deploymentFile = ./deployment.nix;
in
{
  system.stateVersion = 4;
  networking.hostName = "cid";

  nixpkgs.config.permittedInsecurePackages = [
    "python2.7-pyjwt-1.7.1"
  ];

  # virtual machine services
  # services.launchd.user.agents = {
  #   test-vm = {
  #     enable = true;
  #     script = ''
  #       deploymentFile="${deploymentFile}"
  #
  #       ${pkgs.nixops}/bin/nixops create -d test $deploymentFile || true
  #       ${pkgs.nixops}/bin/nixops deploy -d test --include=my-vm --check
  #     '';
  #   };
  # };

  nix.settings.sandbox = true;
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.defaults = {
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.InitialKeyRepeat = 20;
  };

  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  services.yabai.enable = false;
  services.yabai.enableScriptingAddition = true;
  services.yabai.package = pkgs.yabai;
  services.yabai.config = {
    enable = true;
    sticky = "on";
    mouse_follows_focus = "off";
    focus_follows_mouse = "autoraise";
    window_placement = "second_child";
    window_opacity = "off";
    window_opacity_duration = 0.0;
  };

  services.skhd.enable = false;
  services.skhd.package = pkgs.skhd;
  services.skhd.skhdConfig = ''
    # move window focus
    alt - h : yabai -m window --focus west
    alt - j : yabai -m window --focus south
    alt - k : yabai -m window --focus north
    alt - l : yabai -m window --focus east

    # move windows
    shift + alt - h : yabai -m window --swap west
    shift + alt - j : yabai -m window --swap south
    shift + alt - k : yabai -m window --swap north
    shift + alt - l : yabai -m window --swap east
  '';

  environment = {
    # Storing defaults to remember possible configurations
    # darwinConfig = "\$HOME/.nixpkgs/darwin-configuration.nix";

    # run after all variable and profileVariables have been set
    # for shell env.
    # extraInit = "";

    # Shell script code called during interactive shell initialisation. 
    # This code is asumed to be shell-independent, which means you should 
    # stick to pure sh without sh word split.
    # interactiveShellInit = "";

    # List of additional package outputs to be symlinked into /run/current-system/sw.
    # extraOutputsToInstall

  };

  environment.systemPackages =
    with pkgs;
    with inputs;
    [
      docker-client
      docker
      terraform
      # comes up as undefined
      # pkgconfig
      nix-index
      pciutils
      tfswitch
      yarn2nix
      starship
      dnsmasq
      ansible
      ripgrep
      weechat
      gnumake
      openssh
      nixops
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
      yarn
      xsel
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
      git
      gh
    ];


  users.users = {
    ldesiqueira = {
      uid = 1002;
      packages = [ pkgs.home-manager ];
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ldesiqueira =
    { ... }: {
      imports = [ ../../modules/home-manager/blackmatter ];

      home.stateVersion = "21.11";
      programs.home-manager.enable = true;

      blackmatter.programs.nvim.enable = true;
      blackmatter.shell.enable = true;
      blackmatter.desktop.alacritty.enable = true;
      blackmatter.envrc.enable = true;

      # stop a dumb bug
      # https://github.com/nix-community/home-manager/issues/3342
      manual.manpages.enable = false;

      # TODO: move this to its own module in the future
      home.file.".gitconfig".text = ''
        [user]
          email = ldesiqueira@pinger.com
          name = luis

        [merge]
          default = merge

        [core]
          pager = delta --dark --line-numbers
          editor = vim

        [delta]
          side-by-side = true
      '';
    };
}
