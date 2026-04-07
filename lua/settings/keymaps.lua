-- Key mappings
vim.g.mapleader = " "

-- Disables default space keymap
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Move selected line up/down (this should just be added to default vim)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Append next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Cycling search results keeps cursor in center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pastes yanked text, but doesn't overwrite yanked register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copies to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Remaps C-c to escape (github copilot doesn't like C-c)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Keep selection after indenting in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Kind of like VSCode's greatest shortcut: ctrl+d. Changes current word, then pressing . will change the next instance of that word
vim.keymap.set("n", "cd", "*Ncgn", { noremap = true })

-- Comment line
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })

-- Misc keybinds

-- Switch line endings
vim.keymap.set("n", "<leader>lu", "<CMD>edit ++ff=unix<CR>")
vim.keymap.set("n", "<leader>ld", "<CMD>edit ++ff=dos<CR>")
