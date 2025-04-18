{
  description = "My little Home-Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    homeManager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Needs the local sources that I cannot put on github.
    home-sources.url = "flake:home-sources";
  };

  outputs = { self, nixpkgs, homeManager, flake-utils, home-sources }:
  let
    pkgs = import nixpkgs { system = "aarch64-darwin"; overlays = [ home-sources.overlay ]; config.allowUnfree = true; config.allowUnfreePredicate = _ : true; };
  in
  {
    templates = import ./templates.nix { lib = pkgs.lib; };

    homeConfigurations."soren" = homeManager.lib.homeManagerConfiguration
    {
      inherit pkgs;

      modules = [
        ./home.nix
        {
          home = {
            homeDirectory = "/Users/soren";
            username = "soren";
            stateVersion = "22.05";
          };
        }
        # pin registry nixpkgs
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.registry.own.flake = self;
          home.sessionVariables.NIX_PATH = "nixpkgs=flake:nixpkgs$\{NIX_PATH:+:$NIX_PATH}";
          nix.package = pkgs.nix;
        }
      ];
    };
  };
}
