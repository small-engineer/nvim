local map = vim.api.nvim_set_keymap

-- Leaderキー設定
map("n", "<Space>", "", {})
vim.g.mapleader = " "

-- coc.nvim関連の設定
map("i", "<TAB>", 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, expr = true, silent = true })
map("i", "<S-TAB>", 'pumvisible() ? "<C-p>" : "<C-h>"', { noremap = true, expr = true, silent = true })
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })

