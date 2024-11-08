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

		vim.keymap.set("n", "<leader>sa", function()
			grapple.tag()
		end, { desc = "Grapple tag" })

		vim.keymap.set("n", "<leader>sh", "<cmd>Grapple open_tags<cr>", { desc = "Grapple open tags" })

		vim.keymap.set("n", "<C-e>", "<cmd>Grapple open_tags<cr>", { desc = "Grapple open tags" })

		vim.keymap.set("n", "<C-0>", function()
			grapple.select({ index = 1 })
		end, { desc = "Grapple select 1" })

		vim.keymap.set("n", "<C-9>", function()
			grapple.select({ index = 2 })
		end, { desc = "Grapple select 2" })

		vim.keymap.set("n", "<C-8>", function()
			grapple.select({ index = 3 })
		end, { desc = "Grapple select 3" })

		vim.keymap.set("n", "<C-7>", function()
			grapple.select({ index = 4 })
		end, { desc = "Grapple select 4" })

		vim.keymap.set("n", "<C-6>", function()
			grapple.select({ index = 5 })
		end, { desc = "Grapple select 5" })

		vim.keymap.set("n", "<C-5>", function()
			grapple.select({ index = 6 })
		end, { desc = "Grapple select 6" })
	end,
}
