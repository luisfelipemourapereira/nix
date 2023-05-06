{
  network.description = "Nginx Web Server Deployment";

  resources.virtualBoxImages = {
    ubuntu = {
      url = "https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso";
      sha256 = "0a6aa0006991392d0bcb7a6aa11d2c2e9e9a416d35c3aef3b3fbf0360e483c12";
    };
  };

  webServer = { config, pkgs, resources, ... }: {
    imports = [ <nixpkgs/nixos/modules/profiles/ubuntu/default.nix> ];

    deployment.targetEnv = "virtualBox";
    deployment.virtualBox.headless = true;
    deployment.virtualBox.memorySize = 1024; # in MB
    deployment.virtualBox.vcpu = 1;

    deployment.virtualBox.baseImage =
      resources.virtualBoxImages.ubuntu.path;

    networking.firewall.allowedTCPPorts = [ 80 ];

    environment.systemPackages = with pkgs; [
      nginx
    ];

    services.nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts."example.com" = {
        locations."/".root = "/var/www";
        locations."/".extraConfig = ''
          index index.html;
        '';
      };
    };
  };
}

