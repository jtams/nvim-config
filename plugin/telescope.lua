vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local builtin = require("telescope.builtin")
local telescope = require("telescope")
local theme = require("telescope.themes")

pcall(telescope.load_extension, "fzf")

vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Old files" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(theme.get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Current buffer" })
vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })

-- Set telescope background color to the same as editor
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = normal.bg, fg = normal.fg })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = normal.bg, fg = normal.fg })
		vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = normal.bg, fg = normal.fg })
	end,
})
