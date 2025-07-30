vim.api.nvim_create_autocmd("FileType", {
    pattern = { "css", "scss", "less" },
    callback = function()
        vim.opt_local.tabstop    = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab  = true
    end,
})
