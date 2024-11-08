return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"ss",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {},
	config = function()
		local snipe = require("snipe")

		snipe.setup({
			ui = {
				position = "cursor",

				open_win_override = {
					border = "rounded",
				},
			},
			navigate = {
				cancel_snipe = "q",
			},
		})

		snipe.ui_select_menu = require("snipe.menu"):new({ position = "center" })
		snipe.ui_select_menu:add_new_buffer_callback(function(m)
			vim.keymap.set("n", "<esc>", function()
				m:close()
			end, { nowait = true, buffer = m.buf })
		end)
		vim.ui.select = snipe.ui_select
	end,
}
