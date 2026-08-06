vim.pack.add({
	-- "https://github.com/catppuccin/nvim",
	"https://github.com/shaunsingh/nord.nvim",
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end,
})

-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("nord")
vim.api.nvim_set_hl(0, "@markup.link.label.tsx", { link = "Normal" })
