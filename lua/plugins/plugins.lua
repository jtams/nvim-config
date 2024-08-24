-- Plugins that don't need much config
return {
	{ "tpope/vim-sleuth" },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},


	"tpope/vim-surround",

	"tpope/vim-fugitive",

	-- "vimpostor/vim-tpipeline",

	"luckasRanarison/tailwind-tools.nvim",

	{
		'mrcjkb/rustaceanvim',
		version = '^5',
	}
}
