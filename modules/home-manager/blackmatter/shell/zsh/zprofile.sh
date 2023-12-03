###############################################################################
# zsh config
###############################################################################

! [ -d ~/.config/shellz ] && mkdir -p ~/.config/shellz

# put this nix hack in so that in macos
# nix intalled zulu java hits the path
# before the native macos java
export PATH=/etc/profiles/per-user/$USER/bin:$PATH
export PATH=~/bin:$PATH

function load_shellz_mod() {
  [ -d ~/.config/shellz/"$1" ] && source ~/.config/shellz/$1/main.sh
}

declare -a shellz_mods=(
  direnv
  path
  xdg
  nix
  tmux
  zstyle
  completions
  ssh_agent
)

for m in "${shellz_mods[@]}"; do
  load_shellz_mod $m
done

# load gh token from sops-nix location if exists
[ -e ~/.config/gh/env/GH_TOKEN ] &&
  export GH_TOKEN=$(cat ~/.config/gh/env/GH_TOKEN)

# some aliases
alias grep=rg
alias cat=bat
alias cd=z

# integrate zoxide
eval "$(zoxide init zsh)"
#
###############################################################################
# android
###############################################################################

export ANDROID_HOME=~/Android/Sdk
export ANDROID_STUDIO=/opt/android-studio
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_STUDIO/bin
export PATH=$PATH:/bin
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH


###############################################################################
# shellhooks
###############################################################################

[ -d ~/.config/shellz/hooks ] && mkdir -p ~/.config/shellz/hooks
[ -f ~/.config/shellz/hooks/main.sh ] && source ~/.config/shellz/hooks/main.sh

# end zsh config
#
# export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/root/perl5";
# export PERL_MB_OPT="--install_base /root/perl5"
# export PERL_MM_OPT="INSTALL_BASE=/root/perl5"
export PERL5LIB="/usr/share/perl/5.34.0/:$PERL5LIB"
export PATH="$PERL5LIB/bin:$PATH"
export C_INCLUDE_PATH=/usr/include:$C_INCLUDE_PATH
export CPATH=$CPATH:/usr/include

# PATH up rbenv at the end
[ -d ~/.rbenv/bin ] && eval "$(~/.rbenv/bin/rbenv init - zsh)"
