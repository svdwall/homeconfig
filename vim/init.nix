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
        EOF
      ''
    ];

        #${lib.strings.fileContents ./lsp.lua}
    plugins = with pkgs.vimPlugins; [
      # Colorscheme and icons
      gruvbox
      nvim-web-devicons

      # airline
      vim-airline
      vim-airline-themes

      # File organization
      fzf-lua
      nerdtree

      # Autocomplete
      coq_nvim

      # LSP
      lsp-colors-nvim
      nvim-lspconfig

      ## Langs
      # Nix
      vim-nix

      # C++
      vim-ccls
    ];
  };
}
