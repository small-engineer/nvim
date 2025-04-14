local M = {}

function M.load_modules_from_dir(dir)
    local handle = io.popen("find " .. dir .. " -type f -name '*.lua'")
    assert(handle, "Failed to scan directory: " .. dir)
    for file in handle:lines() do
        local module_name = file:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
        require(module_name)
    end
    handle:close()
end

return M

