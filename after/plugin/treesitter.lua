-- Treesitter

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
end, 0)
