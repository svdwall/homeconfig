{
  description = "A simple C project";

  outputs = { self, nixpkgs, flake-utils }: 
  flake-utils.lib.eachDefaultSystem (system:
  with import nixpkgs { inherit system; };
  {
    devShells.default = mkShell {
      packages = [ 
        llvmPackages_17.libllvm
      ];
    };
  });
}
