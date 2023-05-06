{
  network.description = "Nginx Web Server Deployment";

  webServer = { config, pkgs, resources, ... }: {
    deployment.targetEnv = "virtualbox";
    deployment.virtualBox.headless = true;
    deployment.virtualBox.memorySize = 1024; # in MB
    deployment.virtualBox.vcpu = 1;

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

