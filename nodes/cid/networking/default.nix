{ config, pkgs, inputs, ... }: {
  #########################################################################
  # networking
  #########################################################################

  # enable packet forwarding in order to use macos
  # to route through VPN for other clients
  # system.sysctl."net.ipv4.ip_forward" = 1;
  # launchd.user.agents.router = {
  #   serviceConfig.RunAtLoad = true;
  # };


  # end networking
}
