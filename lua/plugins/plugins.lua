-- Plugins that don't need much config
return {
	{ "tpope/vim-sleuth" },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	"github/copilot.vim",

	"tpope/vim-surround",
}
