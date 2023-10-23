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
        ${lib.strings.fileContents ./ufo.lua}
        ${lib.strings.fileContents ./rust-tools.lua}
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

      # Autocompletion coq
      coq_nvim
      coq-artifacts

      # Codefolding
      nvim-ufo

      # git
      vim-fugitive

      # LSP
      lsp-colors-nvim
      nvim-lspconfig

      # Language support
      rust-tools-nvim
      vim-nix
      vim-ccls
      Coqtail
    ];
  };
}
