{ config, pkgs, inputs, outputs, ... }: {
  users.users = {
    ldesiqueira = {
      uid = 1002;
      packages = [ pkgs.home-manager ];
    };
  };

  home-manager.users.ldesiqueira =
    { ... }: {
      imports = [ ../../../modules/home-manager/blackmatter ];

      home.stateVersion = "21.11";
      home.sessionVariables = {
        EDITOR = "vim";
        AWS_REGION = "us-west-2";
        AWS_DEFAULT_REGION = "us-west-2";
        AWS_PROFILE = "pinger-organization";
      };
      programs.home-manager.enable = true;

      blackmatter.programs.nvim.enable = true;
      # blackmatter.programs.nvim.package = outputs.packages.aarch64-darwin.drzln-neovim;
      blackmatter.shell.enable = true;
      blackmatter.desktop.alacritty.enable = true;
      blackmatter.envrc.enable = true;

      # stop a dumb bug
      # https://github.com/nix-community/home-manager/issues/3342
      manual.manpages.enable = false;

      # TODO: gitconfig: move this to its own module in the future
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

      # TODO: redis: move this to its own module in the future
      # home.file."".text = ''
      #   host 127.0.01
      #   port 6379
      #   requirepass mypassword
      # '';
    };
}
