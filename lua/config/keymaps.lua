-- Key mapping
-- Most of this stuff is from ThePrimegen's config

-- Move selected line up/down (this should just be added to default vim)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Append next line to current line
vim.keymap.set('n', 'J', 'mzJ`z')

-- Cycling search results keeps cursor in center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Swaps the selected text with the last yanked text.
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Copies to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Disables auto commenting new lines because it's annoying in most situations
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local current_format_options = vim.api.nvim_buf_get_option(0, 'formatoptions')
    current_format_options = current_format_options:gsub('[cro]', '')
    vim.api.nvim_buf_set_option(0, 'formatoptions', current_format_options)
  end,
})





































