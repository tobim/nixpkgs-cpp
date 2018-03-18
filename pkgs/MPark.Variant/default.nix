{ stdenv, fetchurl, cmake
, version, sha256}:

stdenv.mkDerivation rec {
  name = "MPark.Variant-${version}";

  src = fetchurl {
    url = https://github.com/mpark/variant/archive/ + "${version}" + ".tar.gz";
    sha256 = "${sha256}";
  };

  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    description = "An implementation of C++17 std::variant for C++11/14/17.";
    homepage = https://github.com/mpark/variant;
    license = licenses.boost;
    platforms = platforms.all;
    maintainers = with maintainers; [ tobim ];
  };
}
