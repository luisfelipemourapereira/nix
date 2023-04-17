{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.blackmatter;
  nord-web-theme = pkgs.stdenv.mkDerivation {
    name = "nord-web-theme";
    src = ./extensions/nord.xpi;
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/lib/firefox/browser/extensions
      cp ${./extensions/nord.xpi} $out/lib/firefox/browser/extensions/nord.xpi
    '';
  };
in
{
  options = {
    blackmatter = {
      desktop.firefox.enable = mkEnableOption "desktop.firefox";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.firefox.enable {
      programs.firefox = {
        enable = true;
        # settings = {
        #   "lightweightThemes.selectedThemeID" = "t3rro@proton.me";
        #   "lightweightThemes.usedThemes" = pkgs.lib.mkForce [
        #     {
        #       id = "t3rro@proton.me";
        #       name = "nord";
        #       description = "nord for firefox";
        #       author = "t3rro";
        #       version = "1.0";
        #       textcolor = "#D8DEE9";
        #       accentcolor = "#2E3440";
        #       headerURL = "data:image/png;base64,$(base64 /.svg)";
        #       iconURL = "data:image/png;base64,$(base64 /path/to/icon.png)";
        #     }
        #   ];
        # };
        package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
          # results in unexpected argument when used
          # forceWayland = false;
          extraPolicies = {
            ExtensionSettings = {
              "nord-web-theme@pleme.io" = {
                installation_mode = "force_installed";
                install_url = "file://${nord-web-theme}/lib/firefox/browser/extensions/nord.xpi";
              };
            };
          };
        };
      };
    })
  ];
}
