-- Plugins that don't need much config
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"tpope/vim-sleuth", -- Detect indent settings
	"tpope/vim-fugitive", -- Git commands
	"luckasRanarison/tailwind-tools.nvim", -- Tailwind CSS
	"mrcjkb/rustaceanvim", -- Rust

	"ziglang/zig.vim",

	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
