{ config, pkgs, lib, ... }:
let
  # The folder contains the expected `~/.config/nvim/` structure
  # This structure is the same for plugins.
  # I therefore just load this folder as plugin.
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
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./neovim/extraConfig.vim)
      ''
        lua <<EOF
        require('gitsigns').setup()
        require("nvim-surround").setup()
        require("ibl").setup()
        require("oil").setup()
        EOF
      ''
    ];

    plugins = with pkgs.vimPlugins; [
      # Config
      configuration

      # Colorscheme and icons
      gruvbox
      nvim-web-devicons

      # airline
      vim-airline
      vim-airline-themes

      # File organization
      {
        plugin = fzf-lua;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/fzf.lua);
      }
      oil-nvim

      # Autocompletion coq
      {
        plugin = coq_nvim;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/coq.lua);
      }
      coq-artifacts

      # Codefolding and related visuals
      {
        plugin = nvim-ufo;
        type = "lua";
        config = builtins.readFile(./neovim/plugin_configs/ufo.lua);
      }
      indent-blankline-nvim

      # editing
      nvim-surround
      vim-commentary

      # git
      vim-fugitive
      gitsigns-nvim

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

      # Language support
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
