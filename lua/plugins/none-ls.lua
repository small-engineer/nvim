local null_ls = require("null-ls")
local mason   = require("mason-null-ls")

-- Mason で扱うフォーマッタ一覧
mason.setup({
    ensure_installed = {
        -- Lua     : stylua
        "stylua",
        -- Python  : black
        "black",
        -- JS/TS   : prettier
        "prettier",
        -- Go      : goimports
        "goimports",
        -- Rust    : rustfmt
        "rustfmt",
        -- C/C++   : clang-format
        "clang_format",
        -- JSON    : jq
        "jq",
        -- YAML    : yamlfmt
        "yamlfmt",
    },
    automatic_installation = true,
})

null_ls.setup({
    sources = {
        -- フォーマッタ
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.yamlfmt,
    },
})
