{ outputs, ... }: {

  imports = [ outputs.homeManagerModules.blackmatter ];

  blackmatter.desktop.monitors = {
    main = {
      name = "DisplayPort-0";
    };
  };
}
