{ outputs, ... }: {

  imports = [ outputs.homeManagerModules.blackmatter ];

  blackmatter.desktop.monitors = {
    main = {
      name = "DP-2";
    };
  };
}
