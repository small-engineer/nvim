vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
    end,
})

local lspconfig = require("lspconfig")
lspconfig.marksman.setup({
    cmd = { "marksman", "serve" },
    filetypes = { "markdown" },
    root_dir = lspconfig.util.root_pattern(".git", "."),
})

