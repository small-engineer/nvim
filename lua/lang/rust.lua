vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.opt_local.tabstop    = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab  = true
    end,
})
