{ lib, stdenv, fetchFromGitHub, go, nodejs, docker, makeWrapper, gcc, cmake, pkgconfig, openssl, zlib, python3 }:

stdenv.mkDerivation rec {
  pname = "ollama";
  version = "0.1.21";

  src = fetchFromGitHub {
    owner = "jmorganca";
    repo = pname;
    rev = "v${version}";
    sha256 = "4c54f0ddeb997cfefe4716e5631b270112975aab";
  };

  nativeBuildInputs = [ go nodejs docker makeWrapper gcc cmake pkgconfig ];
  buildInputs = [ openssl zlib python3 ];

  # configurePhase = ''
  #   # Configuration steps if any
  # '';

  buildPhase = ''
    pushd app
    npm install
    npm run build
    popd
    ./scripts/build.sh ${version}
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r path/to/built/binary $out/bin/  # Replace with the actual path of the built binary
  '';

  meta = with lib; {
    description = "Ollama - AI-powered application"; # Replace with a proper description
    homepage = "https://github.com/jmorganca/ollama";
    license = licenses.mit;
    maintainers = with maintainers; [ ]; # Add maintainers
  };
}
