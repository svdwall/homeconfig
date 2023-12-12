-- nix fix: deps not in store.
vim.g.coq_settings = { 
--    [ "xdg" ] = true, not needed no more
    [ "auto_start" ] = 'shut-up',
    [ "display.icons.mode" ] = 'none',
    [ "display.pum.fast_close" ] = false,
    [ "keymap.jump_to_mark" ] = '<Leader>jj'
}
