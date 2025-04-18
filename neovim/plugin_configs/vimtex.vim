let g:vimtex_view_method = 'sioyek'
let g:vimtex_callback_progpath = 'nvim'

let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_reading_bar = 1

" https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/#zathura
function! s:TexFocusVim() abort
    silent execute "!open -a iTerm2"
    redraw!
endfunction

augroup vimtex_event_focus
    au!
    au User VimtexEventViewReverse call s:TexFocusVim()
    au User VimtexEventView call s:TexFocusVim()
augroup END

