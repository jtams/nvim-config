return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		local codecompanion = require("codecompanion")
		codecompanion.setup({})
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ai",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true }
		)
	end,
}
