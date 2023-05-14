###############################################################################
# services running on macos
###############################################################################
{ config, pkgs, inputs, ... }: 
let
  deploymentFile = ./deployment.nix;
in
{

  #############################################################################
  # virtual machine services
  #############################################################################
  launchd.user.agents = {
    rex = {
      script =
        let
          # shorthand
          nixops = "${pkgs.nixops}/bin/nixops";
          create = "${nixops} create -d test ";
          deploy = "${nixops} deploy -d test ";
          start = "${nixops} start -d test ";
          stop = "${nixops} stop -d test ";

          nixops_create =
            "${create} ${deploymentFile} || true";
          nixops_deploy =
            "${deploy} --include=rex --check";
          nixops_start = "${start} --include=rex";
          nixops_stop = "${stop} --include=rex";
        in
        ''
          ${nixops_create}
          ${nixops_deploy}
          ${nixops_start}
          trap '${nixops_stop}'; exit 0' TERM
          while true; do sleep 300;done
        '';
    };
  };
  # end virtual machine services
}
# end services running on macos
