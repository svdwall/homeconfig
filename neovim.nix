{ config, pkgs, lib, ... }:
let
  # load general config and ft-plugins the same as any plugin
  configuration = pkgs.vimUtils.buildVimPlugin {
    pname = "configuration";
    version = "1.0.0";
    src = ./neovim/configuration;
  };
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    # leader needs to be set before plugins
    extraConfig = ''let mapleader = "\<Space>"'';

    plugins = with pkgs.vimPlugins; [
      # config
      configuration

      # colorscheme, icons, airline
      {
        plugin = gruvbox;
        config = builtins.readFile(./neovim/plugin_configs/gruvbox.vim);
      }
      nvim-web-devicons
      {
        plugin = vim-airline;
        config = "let g:airline_powerline_fonts = 1";
      }
      vim-airline-themes

      # file organization
      {
        plugin = fzf-lua;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/fzf.lua);
      }
      {
        plugin = oil-nvim;
        type = "lua";
        config = "require('oil').setup()";
      }

      # autocompletion
      {
        plugin = coq_nvim;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/coq.lua);
      }
      coq-artifacts

      # codefolding and related visuals
      {
        plugin = nvim-ufo;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/ufo.lua);
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = "require('ibl').setup()";
      }
      
      # editing
      {
        plugin = nvim-surround;
        type = "lua";
        config = "require('nvim-surround').setup()";
      }
      vim-commentary

      # git
      vim-fugitive
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = "require('gitsigns').setup()";
      }

      # LSP
      lsp-colors-nvim
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/lsp.lua);
      }
      trouble-nvim
      {
        plugin = actions-preview-nvim;
        type = "lua";
        config = ''require("actions-preview").setup {}'';
      }

      # language support
      {
        plugin = rust-tools-nvim;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/rust-tools.lua);
      }
      vim-nix
      vim-ccls
      Coqtail
      {
        plugin = vimtex;
        config = builtins.readFile(./neovim/plugin_configs/vimtex.vim);
      }
    ];
  };
}
