{ stdenv, fetchurl, cmake
, version, sha256}:

stdenv.mkDerivation rec {
  name = "range-v3-${version}";
  version = "0.3.5";

  src = fetchurl {
    url = https://github.com/ericniebler/range-v3/archive/ + "${version}" + ".tar.gz";
    sha256 = "${sha256}";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-DRANGE_V3_NO_EXAMPLE=ON"
    "-DRANGE_V3_NO_PERF=ON"
  ];

  meta = with stdenv.lib; {
    description = "Experimental range library for C++11/14/17";
    homepage = https://github.com/ericniebler/range-v3;
    license = licenses.boost;
    platforms = platforms.all;
    maintainers = with maintainers; [ tobim ];
  };
}
