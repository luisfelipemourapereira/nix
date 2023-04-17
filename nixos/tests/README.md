
run a test like

```
nix-build nixos/tests/modules/testing/provision.nix
```

drop into python shell with
```
"$(nix-build -A driverInteractive nixos/tests/modules/edge/blackmatter.nix)/bin/nixos-test-driver
```
