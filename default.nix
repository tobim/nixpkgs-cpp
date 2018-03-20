# Nixpkgs overlay which aggregates overlays for libraries and tools
# used to develop c++ software
self: super:

let
  gcc48Stdenv = super.overrideCC super.stdenv super.gcc48;
  gcc49Stdenv = super.overrideCC super.stdenv super.gcc49;
  gcc5Stdenv = super.overrideCC super.stdenv super.gcc5;
  gcc6Stdenv = super.overrideCC super.stdenv super.gcc6;
  gcc7Stdenv = super.overrideCC super.stdenv super.gcc7;

  clang36Stdenv = super.overrideCC super.clangStdenv super.clang_36;
  clang37Stdenv = super.overrideCC super.clangStdenv super.clang_37;
  clang38Stdenv = super.overrideCC super.clangStdenv super.clang_38;
  clang39Stdenv = super.overrideCC super.clangStdenv super.clang_39;
  clang4Stdenv = super.overrideCC super.clangStdenv super.clang_4;
  clang5Stdenv = super.overrideCC super.clangStdenv super.clang_5;

in
{
  cpppkgs = import ./c++libs-overlay.nix { stdenv = super.stdenv; } self super;

  gcc48pkgs = import ./c++libs-overlay.nix { stdenv = gcc48Stdenv; } self super;
  gcc49pkgs = import ./c++libs-overlay.nix { stdenv = gcc49Stdenv; } self super;
  gcc5pkgs = import ./c++libs-overlay.nix { stdenv = gcc5Stdenv; } self super;
  gcc6pkgs = import ./c++libs-overlay.nix { stdenv = gcc6Stdenv; } self super;
  gcc7pkgs = import ./c++libs-overlay.nix { stdenv = gcc7Stdenv; } self super;

  clang36pkgs = import ./c++libs-overlay.nix { stdenv = clang36Stdenv; } self super;
  clang37pkgs = import ./c++libs-overlay.nix { stdenv = clang37Stdenv; } self super;
  clang38pkgs = import ./c++libs-overlay.nix { stdenv = clang38Stdenv; } self super;
  clang39pkgs = import ./c++libs-overlay.nix { stdenv = clang39Stdenv; } self super;
  clang4pkgs = import ./c++libs-overlay.nix { stdenv = clang4Stdenv; } self super;
  clang5pkgs = import ./c++libs-overlay.nix { stdenv = clang5Stdenv; } self super;
}



