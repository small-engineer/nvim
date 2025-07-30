local M = {}

function M.setup()
    require("lspsaga").setup({
        lightbulb = { enable = false },
        ui = { border = "rounded" },
    })
end

return M
