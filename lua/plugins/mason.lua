require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",      -- Python
        "lua_ls",       -- Lua
        "solargraph",   -- Ruby
        "ts_ls",        -- JavaScript / TypeScript
        "marksman",     -- Markdown
    },
})

