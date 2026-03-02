let
  pkgs = import <nixpkgs> { };
in

import ./packages.nix { pkgs = pkgs; }
