-- nix fix: deps not in store.
vim.g.coq_settings = { 
    [ "xdg" ] = true,
--    [ "auto_start" ] = 'shut-up',
    [ "display.icons.mode" ] = 'none',
    [ "display.pum.fast_close" ] = false 
}
