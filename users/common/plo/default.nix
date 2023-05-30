{ outputs, ... }: {

  imports = [ outputs.homeManagerModules.blackmatter ];

  blackmatter.desktop.monitors = {
    main = {
      name = "DP-2";
      mode = "1920x1080";
      rate = "360";
    };
  };
}
