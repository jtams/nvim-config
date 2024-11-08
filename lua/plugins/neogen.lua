return {
	"danymat/neogen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"onsails/lspkind.nvim",
	},
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip" })

		vim.api.nvim_set_keymap(
			"n",
			"<leader>dg",
			":lua require('neogen').generate()<CR>",
			{ noremap = true, silent = true, desc = "Generate Documentation" }
		)
	end,
}
