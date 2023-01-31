{ config, pkgs, ... }:

{
  imports = [ ./home.nix ./zsh.nix ];
  
  home.stateVersion = "22.05";


  home.packages = with pkgs; [ 
    nerdfonts 

    subversion
    vscodium

    # TeX
    mytexlive
    (callPackage ./scripts.nix {})
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./extraConfig.vim;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox

      # AIRLINE
      vim-airline
      vim-airline-themes

      nerdtree
    ];
  };
  
  programs.direnv.enable = true;

  
}
