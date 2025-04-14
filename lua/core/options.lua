local opt = vim.opt

-- 基本設定
opt.syntax = "on"
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true
opt.showcmd = true
opt.laststatus = 2
opt.showmode = false

-- 検索設定
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- 表示とファイル設定
opt.wrap = false
opt.ruler = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- その他
opt.wildmenu = true
opt.backspace = { "indent", "eol", "start" }
opt.guifont = "HackGen Console NF"
opt.termguicolors = true

