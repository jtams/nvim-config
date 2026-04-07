-- Config Options

-- Line numbers
vim.o.number = true

-- Relative line numbers
vim.o.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false

-- Hide mode because the status bar already shows it
vim.o.showmode = false

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Makes search case insenstive unless there's a capital letter in the search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn
vim.o.signcolumn = "yes"

-- Update times
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Makes completion menu always appear if there's completion results
-- and doesn't select an item from the completion. 
vim.o.completeopt = "menuone,noselect"

-- Set conceallevel to 2 so that markdown headers are hidden
vim.o.conceallevel = 2

-- Allows for true color in the terminal, needed for color highlighter
vim.o.termguicolors = true

-- Scroll off
vim.o.scrolloff = 10

-- Tab size
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Disable auto commenting
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

