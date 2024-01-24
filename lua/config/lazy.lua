-- Lazy.nvim package manager setup
-- This file loads all the plugins

-- Plugin List

-- nvim-lspconfig -> https://github.com/neovim/nvim-lspconfig
-- nvim-cmp -> https://github.com/hrsh7th/nvim-cmp
-- nvim-telescope -> https://github.com/nvim-telescope/telescope.nvim
-- catppuccino.nvim -> https://github.com/Pocco81/Catppuccino.nvim
-- nvim-lualine -> https://github.com/nvim-lualine/lualine.nvim
-- nvim-treesitter -> https://github.com/nvim-treesitter/nvim-treesitter
-- conform.nvim -> https://github.com/stevearc/conform.nvim
-- gitsigns.nvim -> https://github.com/lewis6991/gitsigns.nvim
-- Comment.nvim -> https://github/com/numToStr/Comment.nvim
-- nvim-autopairs -> https://github.com/windwp/nvim-autopairs
-- harpoon -> https://github.com/ThePrimeagen/harpoon
-- oil.nvim -> https://github.com/stevearc/oil.nvim
-- copilot.vim -> https://github.com/github/copilot.vim
-- vim-surround -> https://github.com/tpope/vim-surround
-- neogen -> https://github.com/danymat/neogen
-- inc-rename.nvim -> https://github.com/smjonas/inc-rename.nvim

-- Plugins that I would consider using becaue they are cool
-- neoscroll.nvim -> https://github.com/karb94/neoscroll.nvim
--   Smooth scrolling

-- nvim-scissors -> https://github.com/chrisgrieser/nvim-scissors
--   Create/Edit snippets. Works with LuaSnip

-- Installs lazy.nvim. Taken from Kickstart.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup
require("lazy").setup({

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Adds Neovim lua signatures and stuff
			"folke/neodev.nvim",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
	},

	{ "tpope/vim-sleuth" },

	{ "nvim-lua/plenary.nvim" },

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
	},

	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},

	-- Statusbar line
	{ "nvim-lualine/lualine.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- Conform. Makes formatting easy
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	{ "lewis6991/gitsigns.nvim" },

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	"github/copilot.vim",
	"tpope/vim-surround",

	{
		"danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"onsails/lspkind.nvim",
		},
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
})
