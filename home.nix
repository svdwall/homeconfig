{ config, lib, pkgs,  ... }:

with pkgs;
let
  mytexlive = callPackage ./texlive.nix {};
  scripts = callPackage ./scripts.nix {};
  meslo = nerdfonts.override { fonts = [ "Meslo"]; };
in {
  imports = [ ./zsh.nix ./neovim.nix ];

  # Make physical copies of applications so that spotlight finds them (since it does not follow symlinks)
  # https://github.com/nix-community/home-manager/issues/1341#issuecomment-778820334
  home.activation = {
    copyApplications = let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      baseDir="$HOME/Applications/Home Manager Copied Apps"
      if [ -d "$baseDir" ]; then
        rm -rf "$baseDir"
      fi
      mkdir -p "$baseDir"
      for appFile in ${apps}/Applications/*; do
        target="$baseDir/$(basename "$appFile")"
        $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
        $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
      done
    '';
  };

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

    # chattools
    zulip-term

    # nix tools
    comma

    # TeX
    mytexlive
    scripts
    ghostscript

    # LSPs 
    ccls
    rust-analyzer
    texlab
    coqPackages.coq-lsp
    ltex-ls
    vscode-langservers-extracted

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
