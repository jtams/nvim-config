-- Comment

return {
	"numToStr/Comment.nvim",
	opts = {},
	config = function()
		-- Comment with Ctrl + /
		require("Comment").setup()
		local comment = require("Comment.api")

		vim.keymap.set("n", "<C-_>", function()
			comment.toggle.linewise.current()
		end, { noremap = true, silent = true })
	end,
}
