{
  description = "Default Flake";

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = mkShell {
        packages = with pkgs; [

        ];
      };

      packages.default = pkgs.stdenv.mkDerivation {
        name = "name";
        src = ./.;
        buildInputs = with pkgs; [

        ];
      }
    });
}
