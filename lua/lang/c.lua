vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.cinoptions = "(0"
        vim.opt_local.formatoptions = "croql"
        vim.opt_local.comments = "s1:/*,mb:*,ex:*/,://"
    end
})

