let mapleader = "\<Space>"

set nocompatible

" spell checking english by default
set spell spelllang=en_us

" theme
set termguicolors
colorscheme gruvbox

" Fixes Airline gruvbox colors
" https://github.com/gruvbox-community/gruvbox/issues/200#issuecomment-2869162757
hi statusline cterm=NONE gui=NONE
hi tabline cterm=NONE gui=NONE
hi winbar cterm=NONE gui=NONE

" linenumbers, line highlight, and scrolloff
set number
set relativenumber
set cursorline
set scrolloff=20

" Expand tabs to 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" highlight trailing spaces
set list

" Split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Utility
inoremap kj <ESC>
inoremap jk <ESC>
inoremap ;; ;<ESC>

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
