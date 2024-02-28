-- Autocompletion
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		"onsails/lspkind.nvim",
	},
	config = function()
		local lspkind = require("lspkind")
		require("cmp").setup({
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 40,
					ellipsis_char = "...",
					menu = {},
				}),
			},
		})
	end,
}
