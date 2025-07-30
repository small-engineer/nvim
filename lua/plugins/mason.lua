-- lua/plugins/mason.lua
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "pyright", "ts_ls", "marksman",
        "jsonls", "yamlls", "html", "cssls",
        "bashls", "dockerls", "clangd", "gopls",
        "rust_analyzer"
    },
    automatic_installation = true,
})
