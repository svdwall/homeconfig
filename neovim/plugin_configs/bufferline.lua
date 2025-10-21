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
