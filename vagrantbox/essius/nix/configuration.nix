# nix configuration for essius machine
{ confg, pkgs, ... }: {
  users.users.vagrant.isNormalUser = false;
  users.users.vagrant.isSystemUser = true;
  # nix = {
  #   package = pkgs.nixFlakes;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  # };
}
