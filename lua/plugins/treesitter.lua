-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"tsx",
					"javascript",
					"typescript",
					"vimdoc",
					"vim",
					"bash",
				},

				sync_install = true,
				ignore_install = {},
				modules = {},

				auto_install = true,

				highlight = { enable = true },
				indent = { enable = true },
			})

			-- This is a hack to fix the issue with treesitter adding a weird
			-- underline that doesn't seem to be addressed yet.
			-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1506#issuecomment-1823744102
			vim.api.nvim_set_hl(0, "@text.uri.vue", { link = "Indentifier" })
		end, 0)
	end,
}
