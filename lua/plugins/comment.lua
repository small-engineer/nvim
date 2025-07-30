local M = {}

function M.setup()
    require("Comment").setup({
        padding = true, -- コメントとコードの間にスペースを入れる
        ignore  = "^$", -- 空行は無視
    })
end

return M
