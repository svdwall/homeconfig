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
  home.file."Applications/home-manager".source =
    let
      apps = buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in lib.mkIf pkgs.stdenv.targetPlatform.isDarwin "${apps}/Applications";

  fonts.fontconfig.enable = true;

  home.packages = [ 
    # nix + nix tools
    config.nix.package
    comma

    # fonts
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
    zulip-term
    teams

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
