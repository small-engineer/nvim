vim.api.nvim_create_autocmd("FileType", {
    pattern = "ruby",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

local lspconfig = require("lspconfig")
lspconfig.solargraph.setup({
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
    settings = {
        solargraph = {
            diagnostics = true,
        },
    },
})

