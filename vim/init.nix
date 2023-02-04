{ config, pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./extraConfig.vim)
      ''
        lua <<EOF
        ${lib.strings.fileContents ./lsp.lua}
        EOF
      ''
    ];

    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox

      # AIRLINE
      vim-airline
      vim-airline-themes

      nerdtree

      # Langs
      lsp-colors-nvim
      nvim-lspconfig
      
      # C++
      vim-ccls
    ];
  };
}
