vim.api.nvim_create_autocmd("FileType", {
    pattern = "dockerfile",
    callback = function()
        vim.opt_local.tabstop    = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab  = true
    end,
})
