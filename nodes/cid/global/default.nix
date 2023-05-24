{ config, pkgs, inputs, ... }: {
  system.stateVersion = 4;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  networking.hostName = "cid";
  services.nix-daemon.enable = true;
  # false because my config size blows up the sandbox
  nix.settings.sandbox = false;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.package = pkgs.nixFlakes;
  documentation = {
    info.enable = false;
    doc.enable = false;
    man.enable = false;
    enable = false;
  };
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

}
