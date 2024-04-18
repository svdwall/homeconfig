let g:vimtex_view_method = 'skim'

let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_reading_bar = 1

" https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/#zathura
function! s:TexFocusVim() abort
  silent execute "!open -a iTerm"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END

