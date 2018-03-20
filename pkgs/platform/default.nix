{ stdenv, fetchurl, fetchFromGitHub
, version ? null, rev ? null, sha256
, cmake, boost
}:

let
  rv = if version != null
    then "${version}"
    else "${rev}";

  src = if version != null
    then fetchurl {
      url = https://github.com/tobimpub/platform/archive/ + "${version}" + ".tar.gz";
      sha256 = "${sha256}";
    }
    else fetchFromGitHub {
      owner = "tobimpub";
      repo = "platform";
      rev = "${rev}";
      sha256 = "${sha256}";
    };

in
stdenv.mkDerivation rec {
  name = "platform-${rv}";

  inherit src;

  propagatedBuildInputs = [ boost ];
  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    description = "Build platform instpection for c++";
    license = licenses.boost;
    platforms = platforms.all;
    maintainers = with maintainers; [ tobim ];
  };
}
