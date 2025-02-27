{ lib }:
let
  dir2template = dir: _: { path = ./templates/${dir}; description = (import ./templates/${dir}/flake.nix).description; };
in
lib.attrsets.mapAttrs dir2template (builtins.readDir(./templates))
