# the vader identity
{ config, pkgs, ... }: {
  networking.hostName = "vader";
  networking.wireless.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sdb";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.eno2.useDHCP = true;
  networking.interfaces.eno3.useDHCP = true;
  networking.interfaces.eno4.useDHCP = true;
  users.defaultUserShell = pkgs.zsh;
  security.sudo.wheelNeedsPassword = false;
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = true;
  services.openssh.permitRootLogin = "yes";
  users.users.luis = {
    openssh.authorizedKeys.keys = [''
      ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLhg86QwXk4y65DsabycSWIaa6dA2ArRnOLuMwtXnG/RyHYp7KbyESHtMmidE
      7wACHShYbN7kUU9RxOwq1jS73ClEEe2WtsSz4T5lcVl0/mSCSg1auPNaGUI2HQ3unG50adVpNh4WHfxJR12jGuwLxa4ZINtz8V5qN5mH2cnqaMkY7fm7/R7ik6S8bFK4B10hFHjdyDTGS+xJWEknNlfn7vtuvj1QSJt2xB1PHvsCS4NZdYGPkOESK9H2RQNnXN6Soi+ySIJlpO+z9ovIeGJd0kASg6Lyq9GuyYAOv/RQFHKCtCe/ow10AwuirUk2guQpo88ORNLj06KTknkzjMHQMb4mB6fTPvhE2dm0EByeglIJIATWAwCbAyisY5pk7Effc98b/hs5x+OR5XO1Tjo6v+doL0rTHB79Q7/oxr3WK+JjlLpSRJVR0A4RqYQEUic/a7GFFE5ZBxF9pdcnLneW8CkNbztCY7QxsxnMOfwZCLTAIj95iKeXLvvABB2iSXy8= luis@ani''];
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  environment.systemPackages = with pkgs; [ git vim ];
}
