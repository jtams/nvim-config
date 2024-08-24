-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"tsx",
					"javascript",
					"typescript",
					"vimdoc",
					"vim",
					"bash",
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
						goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
						goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
						goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
					},
					swap = {
						enable = true,
						swap_next = { ["<leader>>"] = "@parameter.inner" },
						swap_previous = { ["<leader><"] = "@parameter.outer" },
					},
					lsp_interop = {
						enable = true,
						peek_definition_code = {
							["gD"] = "@function.outer",
						},
					},
				},
				textsubjects = {
					enable = true,
					keymaps = {
						["."] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
					},
				},

				sync_install = true,
				ignore_install = {},
				modules = {},

				auto_install = true,

				highlight = { enable = true },
				indent = { enable = true },
			})

			-- This is a hack to fix the issue with treesitter adding a weird
			-- underline that doesn't seem to be addressed yet.
			-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1506#issuecomment-1823744102
			vim.api.nvim_set_hl(0, "@text.uri.vue", { link = "Indentifier" })
		end, 0)
	end,
}
