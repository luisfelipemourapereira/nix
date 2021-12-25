# example of standard derivation
# below derivation is minimal required parameters
#stdenv.mkDerivation rec {
#  # pname and version over name as a standard
#  # will produce a name like "#{pname}-#{version}"
#  pname = "libfoo";
#  version = "1.2.3";
#  src = fetchurl {
#    url = "http://example.org/libfoo-source-${version}.tar.bz2";
#    sha256 = "0x2g1jqygyr5wiwg4ma1nd7w4ydpy82z9gkcv8vh2v8dn3y58v5m";
#  };
#}
