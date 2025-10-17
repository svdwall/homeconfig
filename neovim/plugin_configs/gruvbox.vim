
let g:gruvbox_italic = 1
colorscheme gruvbox

" Fixes Airline gruvbox colors
" https://github.com/gruvbox-community/gruvbox/issues/200#issuecomment-2869162757
hi statusline cterm=NONE gui=NONE
hi tabline cterm=NONE gui=NONE
hi winbar cterm=NONE gui=NONE

" Better Fugitive colors
hi DiffAdd     cterm=reverse ctermfg=106 ctermbg=235 gui=reverse guifg=#98971a guibg=#282828
hi DiffDelete  cterm=reverse ctermfg=124 ctermbg=235 gui=reverse guifg=#cc241d guibg=#282828
hi DiffChange  cterm=reverse ctermfg=72  ctermbg=235 gui=reverse guifg=#689d6a guibg=#282828
