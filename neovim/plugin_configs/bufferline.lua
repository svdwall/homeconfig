require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        name_formatter = function(buf)
            local clients = vim.lsp.get_clients({ bufnr = buf.id })
            if #clients == 0 then
                return buf.name
            end
            local names = {}
            for _, c in ipairs(clients) do
                table.insert(names, c.name)
            end
            return buf.name .. " [" .. table.concat(names, ",") .. "]"
        end,
    }
})

-- Function to check if Oil is the only buffer
local function toggle_bufferline()
  local buffers = vim.tbl_filter(function(buf)
    return vim.bo[buf].buflisted and vim.bo[buf].filetype ~= "oil"
  end, vim.api.nvim_list_bufs())
  if #buffers == 0 then
    vim.opt.showtabline = 0
  else
    vim.opt.showtabline = 2
  end
end

-- Autocommand to trigger when buffers are entered or changed
vim.api.nvim_create_autocmd({"BufEnter", "BufLeave"}, {
  callback = toggle_bufferline,
})
