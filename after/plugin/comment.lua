-- Comment

-- Comment with Ctrl + /
local comment = require("Comment.api")

vim.keymap.set("n", "<C-_>", function()
	comment.toggle.linewise.current()
end, { noremap = true, silent = true })
