-- Theme
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin-macchiato")
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	end,
-- }

return {
	"shaunsingh/nord.nvim",
	-- "nordtheme/vim",
	name = "nord",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nord")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		vim.cmd("highlight SignColumn guibg=none")
	end,
}
