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
			},
		})

		pcall(telescope.load_extension, "fzf")

		vim.keymap.set("n", "<leader>?", builtin.oldfiles)
		vim.keymap.set("n", "<leader><space>", builtin.buffers)

		-- Like an advanded file search (from Kickstart.nvim)
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(theme.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end)

		vim.keymap.set("n", "<leader>sf", builtin.find_files)
		vim.keymap.set("n", "<leader>sg", builtin.live_grep)
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
		vim.keymap.set("n", "<leader>gf", builtin.git_files)
	end,
}
