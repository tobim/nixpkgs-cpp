{ stdenv, fetchurl, fetchFromGitHub
, version ? null, rev ? null, sha256
, cmake}:

let
  rv = if version != null
    then "${version}"
    else "${rev}";

  src = if version != null
    then fetchurl {
      url = https://github.com/catchorg/Catch2/archive/ + "${version}.tar.gz";
      sha256 = "${sha256}";
    }
    else fetchFromGitHub {
      owner = "catchorg";
      repo = "Catch2";
      rev = "${rev}";
      sha256 = "${sha256}";
    };

in
stdenv.mkDerivation rec {
  name = "Catch2-${rv}";

  inherit src;

  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    description = "A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD";
    homepage = https://github.com/catchorg/Catch2;
    license = licenses.boost;
    platforms = platforms.all;
    maintainers = with maintainers; [ tobim ];
  };
}

