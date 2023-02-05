{ config, pkgs, ... }:

{
  imports = [ ./zsh.nix ./vim/init.nix ];
  
  home.stateVersion = "22.05";

  home.username = "soren";
  home.homeDirectory = "/Users/soren";

  home.packages = with pkgs; [ 
    # font 
    (nerdfonts.override { 
      fonts = [ "Meslo" ];
    })

    subversion
    vscodium

    # fzf and related
    fzf
    fd
    ripgrep

    # TeX
    mytexlive
    (callPackage ./scripts.nix {})

    # C++
    ccls
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  
  programs.direnv.enable = true;

  
}
