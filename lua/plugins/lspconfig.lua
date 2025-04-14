local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 共通の on_attach 関数
local function on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
end

-- Mason 管理下の LSP サーバー
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
        })
    end,
    ["ts_ls"] = function()
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        })
    end,
    -- Markdown LSPサーバー (marksmanの設定例)
    ["marksman"] = function()
        lspconfig.marksman.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "markdown" },
            root_dir = lspconfig.util.root_pattern(".marksman.toml", ".git"),
        })
    end,
})

-- Mason 管理外の LSP サーバー（手動設定）
lspconfig.perlls.setup({
    cmd = { "perl", "-MPerl::LanguageServer", "-e", "Perl::LanguageServer::run", "--", "--port", "13603", "--nostdio" },
    filetypes = { "perl" },
    root_dir = lspconfig.util.root_pattern(".git", "."),
    capabilities = capabilities,
    on_attach = on_attach,
})

