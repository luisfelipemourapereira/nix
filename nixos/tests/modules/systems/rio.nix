################################################################################
# test: ./modules/rio.nix
################################################################################
let
  mkTest = import ../../../../functions/testing/mkTest.nix;
  case_0 = {
    hostName = "rio";
  };
in
mkTest
{
  name = "rio";
  testScript = ''
    start_all()
    machine = ${case_0.hostName}

    machine.wait_for_unit("network-online.target")
    assert "${case_0.hostName}" == machine.succeed("hostname --fqdn").strip()
  '';

  nodes.machine = {
    imports = [ ../../../../nodes/rio/configuration.nix ];
  };
}
