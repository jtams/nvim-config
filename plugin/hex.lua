vim.pack.add({
	"https://github.com/RaafatTurki/hex.nvim",
})

local hex = require("hex")
hex.setup({})

vim.keymap.set("n", "<leader>hx", hex.toggle, { silent = true, noremap = true, desc = "Toggle Hex Editor" })
