{ pkgs, ... }: {
  programs.chromium.enable = true;
  programs.chromium.package = pkgs.ungoogled-chromium;
  programs.chromium.extensions = [
    # 1password
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa"
  ];
}
