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
