return {
	"uga-rosa/ccc.nvim",
	config = function()
		-- Keymaps: https://github.com/uga-rosa/ccc.nvim/blob/main/doc/ccc.txt#L641
		local ccc = require("ccc")
		local mapping = ccc.mapping

		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
			convert = {
				{ ccc.picker.hex, ccc.output.css_rgb },
				{ ccc.picker.css_rgb, ccc.output.hex },
			},
		})

		vim.keymap.set("n", "<leader>cc", ":CccPick<CR>", { silent = true, noremap = true, desc = "Color Picker" })

		vim.keymap.set(
			"n",
			"<leader>cs",
			":CccConvert<CR>",
			{ silent = true, noremap = true, desc = "Switch color format" }
		)

		vim.keymap.set(
			"n",
			"<leader>ct",
			":CccHighlighterToggle<CR>",
			{ silent = true, noremap = true, desc = "Toggle Color Highlighting" }
		)
	end,
}
