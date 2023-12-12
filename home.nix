{ config, pkgs, ... }:

with pkgs;
let
  mytexlive = callPackage ./texlive.nix {};
  scripts = callPackage ./scripts.nix {};
  myriadpro = callPackage ./myriadpro.nix {};
  meslo = nerdfonts.override { fonts = [ "Meslo"]; };
in {
  imports = [ ./zsh.nix ./neovim.nix ];
  
  home.stateVersion = "22.05";

  home.username = "soren";
  home.homeDirectory = "/Users/soren";

  fonts.fontconfig.enable = true;

  home.packages = [ 
    # fonts
    meslo
    myriadpro
    jetbrains-mono

    # command line tools
    fzf
    fd
    ripgrep
    tldr

    # nix tools
    comma

    # TeX
    mytexlive
    scripts
    neovim-remote # needed to find vim for reverse synctex
 
    # LSPs 
    ccls
    rust-analyzer
    texlab
    coqPackages.coq-lsp

    # Display related
    rectangle

    # Other
    subversion
    vscodium
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
}
