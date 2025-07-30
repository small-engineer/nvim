-- lazy.nvimのインストールパスを定義
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- lazy.nvimをランタイムパスに追加
vim.opt.rtp:prepend(lazypath)

-- lazy.nvimのプラグインセットアップ
require("lazy").setup({
  -- Lightline: シンプルで軽量なステータスライン
  { "itchyny/lightline.vim" },

  -- 自動括弧補完プラグイン
  { "windwp/nvim-autopairs" },

  -- TokyoNightカラースキーム
  { "ghifarit53/tokyonight-vim" },

  -- LSP設定用プラグイン: NeovimでLSP（Language Server Protocol）を使用
  { "neovim/nvim-lspconfig" },

  -- Mason: LSPサーバーやフォーマッタを管理
  { "williamboman/mason.nvim",          config = true },

  -- Mason LSP設定プラグイン
  { "williamboman/mason-lspconfig.nvim" },

  -- 補完エンジン: Neovimでの補完をサポート
  { "hrsh7th/nvim-cmp" },

  -- LSP補完ソース
  { "hrsh7th/cmp-nvim-lsp" },

  -- LuaSnip: スニペット補完のためのプラグイン
  { "saadparwaiz1/cmp_luasnip" },

  -- LuaSnip: スニペットエンジン
  { "L3MON4D3/LuaSnip" },

  -- null-ls: 外部ツールをNeovimに統合してコードフォーマットや診断を行う
  { "jose-elias-alvarez/null-ls.nvim" },

  -- nvim-dap: Neovim用のデバッガー統合
  { "mfussenegger/nvim-dap" },

  -- vim-fugitive: Git統合用プラグイン
  { "tpope/vim-fugitive" },

  -- コメント管理プラグイン: コメントアウトを簡単に操作
  {
    "numToStr/Comment.nvim",
    config = function() require("plugins.comment").setup() end
  },

  -- plenary.nvim: Neovim用のユーティリティ関数ライブラリ
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },

  -- lspsaga.nvim: LSPのユーザーインターフェースを改善
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require("plugins.lspsaga").setup() end
  },

  -- treesitter: より高精度なシンタックスハイライトを提供
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- NvimTree: ファイルツリー
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.nvim_tree").setup() end
  },
  { "nvim-tree/nvim-web-devicons" },

  -- mason-null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function() require("plugins.mason_null_ls").setup() end
  },

  -- vim-markdown: Markdownファイルのシンタックスハイライト
  { "preservim/vim-markdown" },

  -- markdown-preview.nvim: Markdownファイルをリアルタイムでプレビュー
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown", "pandoc" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "md", "pandoc" }
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      require("null-ls").setup({})
    end,
  },

  -- UltiSnips: スニペット管理プラグイン
  { "SirVer/ultisnips" }

})
