# Nixpkgs overlay which aggregates overlays for libraries and tools
# used to develop c++ software
self: super:

let
  gcc48Stdenv = super.overrideCC super.stdenv super.gcc48;
  gcc49Stdenv = super.overrideCC super.stdenv super.gcc49;
  gcc5Stdenv = super.overrideCC super.stdenv super.gcc5;
  gcc6Stdenv = super.overrideCC super.stdenv super.gcc6;
  gcc7Stdenv = super.overrideCC super.stdenv super.gcc7;

  clang35Stdenv = super.llvmPackages_35.stdenv;
  clang37Stdenv = super.llvmPackages_37.stdenv;
  clang38Stdenv = super.llvmPackages_38.stdenv;
  clang39Stdenv = super.llvmPackages_39.stdenv;
  clang4Stdenv = super.llvmPackages_4.stdenv;
  clang5Stdenv = super.llvmPackages_5.stdenv;

  clang35libcxxStdenv = super.llvmPackages_35.libcxxStdenv;
  clang37libcxxStdenv = super.llvmPackages_37.libcxxStdenv;
  clang38libcxxStdenv = super.llvmPackages_38.libcxxStdenv;
  clang39libcxxStdenv = super.llvmPackages_39.libcxxStdenv;
  clang4libcxxStdenv = super.llvmPackages_4.libcxxStdenv;
  clang5libcxxStdenv = super.llvmPackages_5.libcxxStdenv;

in
{
  cpppkgs = import ./c++libs-overlay.nix { stdenv = super.stdenv; } self super;

  gcc48pkgs = import ./c++libs-overlay.nix { stdenv = gcc48Stdenv; } self super;
  gcc49pkgs = import ./c++libs-overlay.nix { stdenv = gcc49Stdenv; } self super;
  gcc5pkgs = import ./c++libs-overlay.nix { stdenv = gcc5Stdenv; } self super;
  gcc6pkgs = import ./c++libs-overlay.nix { stdenv = gcc6Stdenv; } self super;
  gcc7pkgs = import ./c++libs-overlay.nix { stdenv = gcc7Stdenv; } self super;

  clang35pkgs = import ./c++libs-overlay.nix { stdenv = clang35Stdenv; } self super;
  clang37pkgs = import ./c++libs-overlay.nix { stdenv = clang37Stdenv; } self super;
  clang38pkgs = import ./c++libs-overlay.nix { stdenv = clang38Stdenv; } self super;
  clang39pkgs = import ./c++libs-overlay.nix { stdenv = clang39Stdenv; } self super;
  clang4pkgs = import ./c++libs-overlay.nix { stdenv = clang4Stdenv; } self super;
  clang5pkgs = import ./c++libs-overlay.nix { stdenv = clang5Stdenv; } self super;

  clang35libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang35libcxxStdenv; } self super;
  clang37libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang37libcxxStdenv; } self super;
  clang38libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang38libcxxStdenv; } self super;
  clang39libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang39libcxxStdenv; } self super;
  clang4libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang4libcxxStdenv; } self super;
  clang5libcxxpkgs = import ./c++libs-overlay.nix { stdenv = clang5libcxxStdenv; } self super;
}



