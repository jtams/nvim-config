-- Fuzzy finder
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Telescope

		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local theme = require("telescope.themes")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
				file_ignore_patterns = { "node_modules/.*", "node_modules" },
			},
		})

		pcall(telescope.load_extension, "fzf")

		vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Old files" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(theme.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Current buffer" })

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
	end,
}
