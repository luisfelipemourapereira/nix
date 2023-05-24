h:
	@echo "Choose a node to make"
	@echo "---------------------------------"
	@echo " plo:  make node plo"
	@echo " rai:  make node rai"
	@echo " ani:  make node ani"
	@echo " cid:  make node cid"
	@echo " node: make local node"
	@echo ""
	@echo "Displays"
	@echo "---------------------------------"
	@echo " show: show details on this flake"

plo:
	sudo nixos-rebuild switch --flake ".#plo"

rai:
	sudo nixos-rebuild switch --flake ".#rai"

ani:
	darwin-rebuild switch --flake ".#ani"
	brew bundle install

cid:
	darwin-rebuild switch --flake ".#cid"

node:
	build

show:
	nix flake show
