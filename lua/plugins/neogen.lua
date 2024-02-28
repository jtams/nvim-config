return {
	"danymat/neogen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"onsails/lspkind.nvim",
	},
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip" })

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>dg", ":lua require('neogen').generate()<CR>", opts)
	end,
}
