require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua", "python", "typescript", "tsx",
        "json", "markdown", "markdown_inline",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
