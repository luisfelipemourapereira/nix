{ lib, config, pkgs, ... }: 
with lib;
let 
  cfg = config.blackmatter;
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;
in
{
  options = {
    blackmatter = {
      shell.zsh.enable = mkEnableOption "shell.zsh";
      shell.zsh.package = mkOption {
        type = types.package;
    	default = pkgs.zsh;
    	description = lib.mdDoc ''
    	zsh package to be installed
    	'';
      };
    };
  };
  config = mkMerge [
    (mkIf cfg.shell.zsh.enable {
      	# home.packages = [ cfg.shell.zsh.package pkgs.oh-my-zsh ];
      	home.packages = [ cfg.shell.zsh.package ];
  	xdg.configFile."shellz/rbenv/main.sh".source = ./rbenv/main.sh;
  	xdg.configFile."shellz/direnv/main.sh".source = ./direnv/main.sh;
  	xdg.configFile."shellz/direnv/layout_poetry.sh".source = ./direnv/layout_poetry.sh;
  	home.file.".direnvrc".source = ./direnv/direnvrc.sh;
  	xdg.configFile."shellz/path/main.sh".source = ./path/main.sh;
  	xdg.configFile."shellz/history/main.sh".source = ./history/main.sh;
  	xdg.configFile."shellz/sheldon/main.sh".source = ./sheldon/main.sh;
  	xdg.configFile."shellz/nix/main.sh".source = ./nix/main.sh;
  	xdg.configFile."shellz/tmux/main.sh".source = ./tmux/main.sh;
  	xdg.configFile."shellz/ssh_agent/main.sh".source = ./ssh_agent/main.sh;
  	programs.zsh.enable = true;
  	# programs.zsh.plugin.zsh.ohMyZshModule.plugins = ["docker"];
  	programs.zsh.defaultKeymap = "viins";
  	programs.zsh.enableAutosuggestions = true;
  	programs.zsh.enableCompletion = true;
  	programs.zsh.enableSyntaxHighlighting = true;
  	programs.zsh.autocd = false;
  	programs.zsh.history.size = 10000000;
  	programs.zsh.history.save = 10000000;
  	programs.zsh.shellAliases = {
  	  vim = "nvim -u ~/.config/nvim/init.lua";
  	  vimdiff = "nvim -d -u ~/.config/nvim/init.lua";
	  cat = "bat";
  	} // lib.optionalAttrs isLinux {
  	  pbcopy = "xsel --clipboard --input";
  	  pbpaste = "xsel --clipboard --output";
	};
  	programs.zsh.initExtra = builtins.readFile ./zprofile.sh;
  	programs.zsh.prezto.enable = false;
  	programs.zsh.zplug.enable = false;
    })
  ];

}
