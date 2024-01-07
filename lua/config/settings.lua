-- Config Settings

-- Leader set to space
vim.g.mapleader = ' '

-- Open netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Set highlight on search
vim.o.hlsearch = false

-- Line numbers
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Makes search case insenstive unless there's a capital letter in the search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn
vim.wo.signcolumn = 'yes'

-- Update times
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Makes completion menu always appear if there's completion results
-- and doesn't select an item from the completion. Default behaviour
-- selects the first item.
vim.o.completeopt = 'menuone,noselect'

-- Idk this fixed a color problem
vim.o.termguicolors = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Scroll off
vim.opt.scrolloff = 10

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set cursor back to line when exiting vim. With Windows Terminal Vim makes it a block cursor
-- Works with WSL and PowerShell
vim.api.nvim_create_autocmd('VimLeave', { command = 'set guicursor= | call chansend(v:stderr, "\x1b[ q")' })
vim.api.nvim_create_autocmd('VimLeave', { command = 'set guicursor= | call chansend(v:stderr, "\x1b[?12h")' })