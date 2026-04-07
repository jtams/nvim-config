vim.pack.add({
	"https://github.com/saghen/blink.cmp",

	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/folke/lazydev.nvim",
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 400 },
	},
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
})
