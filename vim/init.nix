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
        vim.api.nvim_set_keymap('n', '<c-f>',
          "<cmd>lua require('fzf-lua').files()<CR>",
          { noremap = true, silent = true })
        EOF
      ''
    ];

    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox

      # AIRLINE
      vim-airline
      vim-airline-themes

      # File organization
      fzf-lua
      nerdtree

      # Langs
      lsp-colors-nvim
      nvim-lspconfig
      
      # C++
      vim-ccls
    ];
  };
}
