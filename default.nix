# Nixpkgs overlay which aggregates overlays for libraries and tools
# used to develop c++ software
{ stdenv }: self: super:

with super.lib;

(foldl' (flip extends) (_: super) [

  (import ./c++libs-overlay.nix { inherit stdenv; })

]) self
