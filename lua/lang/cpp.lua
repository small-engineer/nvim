vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "objc", "objcpp" },
    callback = function()
        vim.opt_local.tabstop    = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab  = false
    end,
})
