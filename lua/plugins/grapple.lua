-- Grapple

return {
	"cbochs/grapple.nvim",
	dependencies = {},
	config = function()
		local grapple = require("grapple")
		grapple.setup({
			win_opts = {
				height = 10,
				title_pos = "left",
				title = "Grapple",
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			grapple.tag()
		end)
		vim.keymap.set("n", "<C-e>", "<cmd>Grapple open_tags<cr>")

		vim.keymap.set("n", "<C-t>", function()
			grapple.select({ index = 1 })
		end)

		vim.keymap.set("n", "<C-h>", function()
			grapple.select({ index = 2 })
		end)

		vim.keymap.set("n", "<C-n>", function()
			grapple.select({ index = 3 })
		end)

		vim.keymap.set("n", "<C-s>", function()
			grapple.select({ index = 4 })
		end)
	end,
}
