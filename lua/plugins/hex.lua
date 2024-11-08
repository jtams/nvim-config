return {
	"RaafatTurki/hex.nvim",
	config = function()
		local hex = require("hex")
		hex.setup({})

		vim.keymap.set("n", "<leader>hx", hex.toggle, { silent = true, noremap = true, desc = "Toggle Hex Editor" })
	end,
}
