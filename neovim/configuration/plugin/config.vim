set nocompatible

" spell checking english by default
set spell spelllang=en_us

" theme
set termguicolors

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
