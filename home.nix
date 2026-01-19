{ config, lib, pkgs,  ... }:

with pkgs;
let
  mytexlive = callPackage ./texlive.nix {};
  scripts = callPackage ./scripts.nix {};
  # Until my PR is live:
  teams = callPackage ./teams.nix {};
in
  {
    imports = [ ./zsh.nix ./neovim.nix ];

    # Make physical copies of applications so that spotlight finds them (since it does not follow symlinks)
    # https://github.com/nix-community/home-manager/issues/1341#issuecomment-778820334
    targets.darwin.copyApps.enable = true;
    targets.darwin.linkApps.enable = false;

    fonts.fontconfig.enable = true;
    xdg.configFile."fontconfig/conf.d/50-macos-fonts.conf".text = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
      <fontconfig>
      <dir>/System/Library/Fonts</dir>
      <dir>/Library/Fonts</dir>
      <dir>~/.Library/Fonts</dir>
      <dir>/System/Library/AssetsV2</dir>
      </fontconfig>
    '';

    home.packages = [
    # nix + nix tools
    config.nix.package
    comma

    # fonts
    fontconfig
    nerd-fonts.meslo-lg
    myriadpro
    jetbrains-mono

    # command line tools
    fzf
    fd
    ripgrep
    tldr

    # versioning
    git

    # communication
    discord
    # teams

    adwaita-icon-theme
    inkscape

    # TeX + research
    mytexlive
    scripts
    ghostscript
    sioyek
    zotero

    # LSPs 
    ccls
    rust-analyzer
    texlab
    # This moved somehow?
    # coqPackages.coq-lsp
    ltex-ls
    vscode-langservers-extracted
    pyright
    nixd

    # Display related
    rectangle

    # Other
    subversion
    vscodium
  ]
  ++ lib.optionals stdenv.isDarwin
  [
    iterm2
  ]
  ;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
}
