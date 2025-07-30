local lspconfig    = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- バッファ共通キー割り当て
local function on_attach(_, bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
end

-- Mason‑lspconfig でインストールしたサーバーの一括設定
require("mason-lspconfig").setup_handlers({

    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach    = on_attach,
        })
    end,

    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach    = on_attach,
            settings     = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace   = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry   = { enable = false },
                },
            },
        })
    end,

    ["ts_ls"] = function()
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach    = on_attach,
        })
    end,

    ["marksman"] = function()
        lspconfig.marksman.setup({
            capabilities = capabilities,
            on_attach    = on_attach,
            filetypes    = { "markdown", "pandoc" },
        })
    end,
})
