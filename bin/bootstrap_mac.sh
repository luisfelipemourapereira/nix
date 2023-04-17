#!/usr/bin/env sh

install_nix() {
	if ! command -v nix-env >/dev/null 2>&1; then
	  echo "Installing Nix..."
	  sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
	  if [ -e "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
	  elif [ -e "$HOME/.zshrc" ]; then
	    source "$HOME/.zshrc"
	  fi
	else
	  echo "Nix is already installed."
	fi
}

install_nix_darwin() {
	echo "Installing nix-darwin..."
	nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
	./result/bin/darwin-installer
	! [ -f /usr/bin/darwin-installer ] && 
		cp -r ./result/bin/darwin-installer /usr/bin/darwin-installer
	chmod +x /usr/bin/darwin-installer
}

main() {
	install_nix
	install_nix_darwin
}

main
