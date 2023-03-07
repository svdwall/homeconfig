" vim not vi!
set nocompatible

colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" linenumbers and line highlight
set number
set relativenumber
set cursorline

" Expand tabs to 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" Search path is full dir
set path+=./**

" Split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Utility
inoremap kj <ESC>
inoremap jk <ESC>


" Open NERDTree
nnoremap <C-m> :NERDTreeToggle<CR>
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close if only NERDTree is left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif




