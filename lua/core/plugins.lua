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
  { "numToStr/Comment.nvim",            config = function() require("Comment").setup() end },

  -- plenary.nvim: Neovim用のユーティリティ関数ライブラリ
  { "nvim-lua/plenary.nvim" },

  -- lspsaga.nvim: LSPのユーザーインターフェースを改善
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({
        lightbulb = { enable = false }, -- lightbulb（コードアクション）を無効化
      })
    end
  },

  -- treesitter: より高精度なシンタックスハイライトを提供
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- NvimTree: ファイルツリーを表示
  { "nvim-tree/nvim-tree.lua",         requires = { "nvim-tree/nvim-web-devicons" } },

  -- NvimTree用のアイコンライブラリ
  { "nvim-tree/nvim-web-devicons" },

  -- vim-markdown: Markdownファイルのシンタックスハイライト
  { "preservim/vim-markdown" },

  -- markdown-preview.nvim: Markdownファイルをリアルタイムでプレビュー
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "pandoc" },
    build = "cd app && npm install",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { silent = true, desc = "Markdown プレビュー切替" })
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      require("null-ls").setup({})
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua", "black", "prettier", "clang_format", "goimports", "rustfmt", "jq", "yamlfmt"
        },
        automatic_installation = true,
      })
    end,
  },

  -- vimtex: LaTeX用の強力なプラグイン
  { "lervag/vimtex" },

  -- vim-pandoc: Pandocを使って、MarkdownとLaTeXの変換をサポート
  { 'vim-pandoc/vim-pandoc' },

  -- UltiSnips: スニペット管理プラグイン
  { "SirVer/ultisnips" },

  -- orgmode.nvim: Emacs風のorgモードをNeovimで再現
  {
    "nvim-orgmode/orgmode",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("orgmode").setup({
        org_agenda_files = { "~/org/**/*" },
        org_default_notes_file = "~/org/refile.org",
      })
    end,
  },
})
