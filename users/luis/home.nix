{ config, pkgs, nixpkgs, lib, ... }: {
  # home-manager manage itself
  programs.home-manager.enable = true;

  # home configuration
  home.username = "luis";
  home.homeDirectory = "/home/luis";

  # session variables
  home.sessionVariables = { EDITOR = "neovim"; };

  # user packages
  home.packages = with pkgs; [ ripgrep ];

  # jq
  programs.jq.enable = true;

  # neovim configuration
  programs.neovim.enable = true;
  # programs.neovim.package = pkgs.neovim-nightly;

  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;

  # starship command prompt
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  # your traditional configuration
  programs.starship.settings = {
    add_newline = false;
    format = ''
      [┌───────────────────>](bold blue)
      [│](bold blue)$hostname
      [│](bold blue)$directory
      [│](bold blue)$git_branch
      [└─>](bold blue)$character
          '';
    character = {
      success_symbol = "[>](bold blue)";
      error_symbol = "[✖](bold red) ";
      vicmd_symbol = "[#](bold green)";
      disabled = false;
    };
    cmake = { disabled = true; };
    package = { disabled = true; };
    aws = { disabled = true; };
    battery = { disabled = true; };
    cmd_duration = { disabled = true; };
    conda = { disabled = true; };
    dart = { disabled = true; };
    deno = { disabled = true; };
    docker_context = { disabled = true; };
    dotnet = { disabled = true; };
    elixir = { disabled = true; };
    elm = { disabled = true; };
    erlang = { disabled = true; };
    gcloud = { disabled = true; };
    golang = { disabled = true; };
    helm = { disabled = true; };
    java = { disabled = true; };
    jobs = { disabled = true; };
    julia = { disabled = true; };
    kotlin = { disabled = true; };
    kubernetes = { disabled = true; };
    line_break = { disabled = true; };
    memory_usage = { disabled = true; };
    nim = { disabled = true; };
    nix_shell = { disabled = true; };
    nodejs = { disabled = true; };
    ocaml = { disabled = true; };
    openstack = { disabled = true; };
    perl = { disabled = true; };
    php = { disabled = true; };
    purescript = { disabled = true; };
    python = { disabled = true; };
    red = { disabled = true; };
    ruby = { disabled = true; };
    rust = { disabled = true; };
    scala = { disabled = true; };
    shell = { disabled = true; };
    shlvl = { disabled = true; };
    singularity = { disabled = true; };
    status = { disabled = true; };
    swift = { disabled = true; };
    terraform = { disabled = true; };
    time = { disabled = true; };
    username = { disabled = true; };
    vcsh = { disabled = true; };
    zig = { disabled = true; };
    git_branch = {
      disabled = false;
      style = "bold dimmed cyan";
    };
    git_state = {
      disabled = false;
      format = ''
        [\($state( $progress_current of $progress_total)\)]($style) 
      '';
    };
    git_status = {
      disabled = false;
      conflicted = "⚔️ ";
      # untracked = ''
      # 🛤️\${count}
      # '';
      # diverged = "🔱 🏎️ 💨 ×${ahead_count} 🐢 ×${behind_count}";
      # modified = "📝 ×${count}";
      # stashed = "📦 ";
      # renamed = "📛 ×${count}";
      # deleted = "🗑️  ×${count}";
      # behind = "🐢 ×${count}";
      # staged = "🗃️  ×${count}";
      # format = "$all_status$ahead_behind";
      # ahead = "🏎️ 💨 ×${count}";
      # style = "bright-white";
    };
    hostname = {
      ssh_only = false;
      format = "<[$hostname]($style)>";
      trim_at = "-";
      style = "bold dimmed green";
      disabled = false;
    };
    directory = {
      truncation_length = 2;
      format = "[$path]($style)[$lock_symbol]($lock_style)";
      disabled = false;
      style = "bold dimmed green";
    };
  };
  # default configuration
  # programs.starship.settings = {
  # add_newline = false;
  # format =
  # lib.concatStrings [ "$line_break" "$package" "$line_break" "$character" ];
  # scan_timeout = 10;
  # character = {
  # success_symbol = "➜";
  # error_symbol = "➜";
  # };
  # };

  # alacritty terminal
  # programs.alacritty.enable = true;

  # zsh shell
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.defaultKeymap = "vi";
  programs.zsh.autocd = false;
  programs.zsh.dotDir = ".config/zsh";
  programs.zsh.prezto.enable = true;
  programs.zsh.history.size = 1000000;
  programs.zsh.history.save = 1000000;

  home.stateVersion = "21.11";
}
