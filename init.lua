require("settings.keymaps")
require("settings.options")

local function require_dir(dir)
    for _, file in ipairs(vim.fn.globpath(vim.fn.stdpath("config") .. "/" .. dir, "*.lua", false, true)) do
        local mod = file:match(".+/(.-)%.lua$")
        require(dir:gsub("/", ".") .. "." .. mod)
    end
end

require_dir("lua/plugins")
