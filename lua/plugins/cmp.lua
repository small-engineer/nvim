local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then return end

cmp.setup({
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
})

local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if autopairs_ok then
    autopairs.setup({})
    local cmp_ap = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_ap.on_confirm_done())
end
