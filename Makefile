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
	home-manager switch --flake ".#luis@plo"

rai:
	home-manager switch --flake ".#ldesiqueira@rai" -b backup

ani:
	darwin-rebuild switch --flake ".#ani"
	brew bundle install

cid:
	darwin-rebuild switch --flake ".#cid"

burgundy:
	home-manager switch --flake ".#burgundy"

tupa:
	home-manager switch --flake ".#tupa"

# lucas pereira laptop
LILU:
	home-manager switch --flake ".#LILU"

node:
	build

show:
	nix flake show
