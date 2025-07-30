local group = vim.api.nvim_create_augroup("LspFormatOnSave", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 2000 })
    end,
})
