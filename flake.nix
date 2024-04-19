{
  description = "My little Home-Manager flake";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Needs the local sources that I cannot put on github.
    home-sources.url = "flake:home-sources";
  };

  outputs = { self, nixpkgs, homeManager, flake-utils, home-sources }:
  #flake-utils.lib.eachDefaultSystem (system:
  {
    homeConfigurations."soren" = homeManager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "aarch64-darwin"; overlays = [ home-sources.overlay ]; };

      modules = [
        ./home.nix
        {
          home = {
            homeDirectory = "/Users/soren";
            username = "soren";
            stateVersion = "22.05";
          };
        }
      ];
    };
  };
}
