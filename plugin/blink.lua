vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1",
	},

	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/folke/lazydev.nvim",
})

require("blink.cmp").setup({
	keymap = { preset = "default" },

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 400,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },

		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},

			lsp = {
				enabled = function()
					if vim.bo.filetype ~= "astro" then
						return true
					end

					local line = vim.api.nvim_get_current_line()
					local col = vim.api.nvim_win_get_cursor(0)[2]
					local before_cursor = line:sub(1, col)

					-- Work around an astro-ls crash in HTML path completion.
					-- Typing href=" or src=" can cause vscode-html-languageservice
					-- to throw and kill the entire Astro language server.
					if
						before_cursor:match('href="$')
						or before_cursor:match("href='$")
						or before_cursor:match('src="$')
						or before_cursor:match("src='$")
					then
						return false
					end

					return true
				end,

				override = {
					get_trigger_characters = function(self)
						local chars = self:get_trigger_characters()

						if vim.bo.filetype == "astro" then
							-- Astro returns an incomplete completion list when
							-- Blink requests completion immediately after "<".
							-- Blink then caches that list, hiding component
							-- auto-imports such as ContentBox.astro.
							chars = vim.tbl_filter(function(char)
								return char ~= "<"
							end, chars)
						end

						return chars
					end,
				},
			},
		},
	},

	snippets = {
		preset = "luasnip",
	},

	fuzzy = {
		implementation = "lua",
	},

	signature = {
		enabled = true,
	},
})
