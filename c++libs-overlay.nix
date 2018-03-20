{stdenv}: self: super:
rec {
  inherit stdenv;

  boost = super.boost.override { inherit stdenv; };

  MPark_Variant = super.callPackage ./pkgs/MPark.Variant {
    version = "v1.3.0";
    sha256 = "1ij3k6p5cfm887vcy163a4v34sxnp1v7w0d8jybq7k4gh4gy9xyh";
    inherit stdenv;
  };

  range-v3 = super.callPackage ./pkgs/range-v3 {
    version = "0.3.5";
    sha256 = "0diq6lndzyznv9iidgmf03qkxrv0pyvgbgk88i2y25zya2s9800a";
    inherit stdenv;
  };

  brigand = super.callPackage ./pkgs/brigand {
    rev = "08a54a4c17917bf14333392e56a4971cf52584fe";
    sha256 = "09pmxssgfic29djxjz1dnxq9xmv6c826ac73r990rrl2s4542m0h";
    inherit stdenv;
  };

  platform = super.callPackage ./pkgs/platform {
    version = "v0.1.0";
    sha256 = "0081iscys1gvd0k35jsz8b4x5m1cfa6584bn8mwwcr5p7yxz80m5";
    inherit stdenv;
  };
}
