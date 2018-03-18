{system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = rec {
    MPark_Variant-1_2_2 = callPackage pkgs/MPark.Variant/1.2.2.nix { };
    MPark_Variant = MPark_Variant-1_2_2;

    range-v3-0_3_0 = callPackage pkgs/range-v3/0.3.0.nix { };
    range-v3 = range-v3-0_3_0;

    brigand-git = callPackage pkgs/brigand/git.nix { };
    brigand = brigand-git;

    #todo
    #
    #fmt
    #catch
    #eigen
    #metal
    #gsl
    #gsl-lite
    #abseil
    #folly
    #stlab
    #better-enums
  };
in
self

