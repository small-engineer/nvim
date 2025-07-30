local M = {}

function M.setup()
    require("mason-null-ls").setup({
        ensure_installed = {
            "lua_ls", "pyright", "ts_ls", "marksman",
            "jsonls", "yamlls", "html", "cssls",
            "bashls", "dockerls", "clangd", "gopls",
            "rust_analyzer"
        },
        automatic_installation = true,
    })
end

return M
