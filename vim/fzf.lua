-- Keymaps
vim.api.nvim_set_keymap('n', '<c-f>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true })
