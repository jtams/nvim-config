-- Config Settings

-- Leader set to space
vim.g.mapleader = " "

-- Cursor Block
vim.opt.guicursor = "n-v-c-i:block"

-- Set highlight on search
vim.o.hlsearch = false

-- Line numbers
vim.wo.number = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Hide mode because the status bar already shows it
vim.opt.showmode = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

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
vim.wo.signcolumn = "yes"

-- Update times
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Makes completion menu always appear if there's completion results
-- and doesn't select an item from the completion. Default behaviour
-- selects the first item.
vim.o.completeopt = "menuone,noselect"

-- Set conceallevel to 2 so that markdown headers are hidden
vim.opt_local.conceallevel = 2

-- Allows for true color in the terminal, needed for color highlighter
vim.o.termguicolors = true

-- Scroll off
vim.opt.scrolloff = 10

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable auto commenting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})
