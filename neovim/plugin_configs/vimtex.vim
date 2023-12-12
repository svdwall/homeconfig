let g:vimtex_view_method = 'skim'

let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_reading_bar = 1


function! SetServerName()
    let nvim_server_file = "/tmp/curnvimserver.txt"
    let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
    call system(cmd)
endfunction

augroup vimtex_common
    autocmd!
    autocmd FileType tex call SetServerName()
augroup END
