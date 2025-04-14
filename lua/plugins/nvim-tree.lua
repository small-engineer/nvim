local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "t", api.node.open.tab, opts("Open in New Tab"))
end

require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    highlight_git = true,
    root_folder_label = ":~",
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  on_attach = my_on_attach,
})

