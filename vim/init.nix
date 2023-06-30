{ config, pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./extraConfig.vim)
      ''
        lua <<EOF
        ${lib.strings.fileContents ./fzf.lua}
        ${lib.strings.fileContents ./coq.lua}
        ${lib.strings.fileContents ./lsp.lua}
        EOF
      ''
    ];

    plugins = with pkgs.vimPlugins; [
      # Colorscheme and icons
      gruvbox
      nvim-web-devicons

      # airline
      vim-airline
      vim-airline-themes

      # File organization
      fzf-lua
      #nerdtree

      # Autocomplete
      coq_nvim
      coq-artifacts

      # LSP
      lsp-colors-nvim
      nvim-lspconfig

      ## Langs
      # Nix
      vim-nix

      # C++
      vim-ccls

      # Coq
      Coqtail
    ];
  };
}
