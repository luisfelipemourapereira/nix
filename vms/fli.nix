# a nixops machine for pinger
{
  network.description = "pinger";
  fli =
    { resources, ... }:
    {
      deployment.targetEnv = "libvirtd";
      deployment.libvirtd.headless = "pinger";

      environment.systemPackages = with pkgs;[ curl vim ];
      services.openssh.enable = true;
      users.users.root.openssh.authorizedKeys.keys = [
        "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAACAQCohi3decd59jtdZ1w2Vfbp2fBgSlW/4GcJGe8itNyQG5i9x2mywdZY0P5O7/85RgUnNsqjfY+2e7SoQnECWGpUr7kR3erM5/towDge3xQsoY9d2Bfa8JdFiuZKZQJO2sOFoJxJaCnW0cdhfRwPileONRkU2iJVBmaoJY/PKoBjhwJTHgKXS86qxCHwsh+fhgeYWOFwdAjc8T0pqbPXEXdK/onPLDZJUZ/3n/B4AdxQ2fAgR6f5QdgtH2zec8ZjBDUSfMJi3Gf7DBvRWoLCWft2CHqe2vJyy+H9qL4KqyWz1wQ/W2Car9fdvgm6s7ViVGBoJ02H9n12zZewfqWSJ9Eky7KnAZA7GFQtygFPIvzaXUz7rgRHwPPFq8xY/IObXwe7/IpiCcuNoXd4q5le8zCc399UWfBguKlI2vOKYN8WKjLxaWwc0QtiSHHfd0b5FSFGHjyXSN3YOA0Lldd5KY8jMsiE1xxxqEbdN1dStXARPO0AU71D32vGiE0zeetmghk5NAdKBmmTc3yhPhCmV594UjefSLeMugh18AUz5yJFxYJUckHkc2BdpusBKP8WBwJkJ7Veqvt7fGX4SRXTE8En5Z6OKtzMclo4zzAYue8n0qtcW0clzZAwSLL5P08q4f4frb0tt5SoCRov69ePqEAOQFXj8ZFnMJf/wVJcqu8BXw==
t3rro@rai"
      ];
    };
}
