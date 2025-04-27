return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>zm", function()
			require("zen-mode").toggle({})
		end, { desc = "Toggle Zen Mode" })
	end,
}
