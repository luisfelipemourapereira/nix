{ config, pkgs, nixpkgs, lib, ... }: 
with programs.starship; {
  # starship command prompt
  enable = true;
  enableZshIntegration = true;
  # your traditional configuration
  settings = {
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
}
