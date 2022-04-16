{ rustPlatform, fetchFromGitHub, scdoc, installShellFiles }:

rustPlatform.buildRustPackage rec {
  name = "autorandr-rs";
  src = fetchFromGitHub {
    owner = "theotherjimmy";
    repo = name;
    rev = "51a705e3a3761d32b9e068f48fc34722ca3d2ab7";
    hash = "sha256-ryK7/VYxo/ssMBYmGCJBk7sz+pp2MNPhHJx9LNcm6Lc";
  };
  cargoHash = "sha256-bJXP4L2N3Jg5+hBP5NMs6JT3n2wUqw4y07ycHLNSDZ4=";
  nativeBuildInputs = [ scdoc installShellFiles ];
  preFixup = ''
    installManPage $releaseDir/build/${name}-*/out/${name}.1
    installManPage $releaseDir/build/${name}-*/out/${name}.5
  '';
}
