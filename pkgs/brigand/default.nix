{ stdenv, fetchurl, fetchFromGitHub
, version ? null, rev ? null, sha256
, cmake}:

let
  rv = if version != null
    then "${version}"
    else "${rev}";

  src = if version != null
    then fetchurl {
      url = https://github.com/edouarda/brigand/archive/ + "${version}" + ".tar.gz";
      sha256 = "${sha256}";
    }
    else fetchFromGitHub {
      owner = "edouarda";
      repo = "brigand";
      rev = "${rev}";
      sha256 = "${sha256}";
      fetchSubmodules = true;
    };

in
stdenv.mkDerivation rec {
  name = "brigand-${rv}";

  inherit src;

  nativeBuildInputs = [ cmake ];
  dontBuild = true;

  meta = with stdenv.lib; {
    description = "Instant compile time C++ 11 metaprogramming library.";
    homepage = https://github.com/edouarda/brigand;
    license = licenses.boost;
    platforms = platforms.all;
    maintainers = with maintainers; [ tobim ];
  };
}
