vim.pack.add({
	"https://github.com/tzachar/local-highlight.nvim",
})

require("local-highlight").setup({
	disable_file_types = { "tex", "markdown" },
	hlgroup = "Visual",
	cw_hlgroup = nil,
	insert_mode = false,
	min_match_len = 1,
	max_match_len = math.huge,
	highlight_single_match = true,
	animate = {
		enabled = false,
		easing = "linear",
		duration = {
			step = 10,
			total = 100,
		},
	},
	debounce_timeout = 50,
})
