return {
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					replace = "sr", -- Replace surrounding
					find = nil, -- Find surrounding (to the right)
					find_left = nil, -- Find surrounding (to the left)
				},
			})
		end,
	},

	{
		"echasnovski/mini.comment",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "cpp", "c" },
				callback = function()
					vim.bo.commentstring = "// %s"
				end,
			})

			local MiniComment = require("mini.comment")

			MiniComment.setup({
				mappings = {
					comment = "gc",
					comment_line = "gcc",
					comment_visual = "gc",
					textobject = "gc",
				},
			})

			-- Map Ctrl+/ for normal mode
			vim.keymap.set("n", "<C-_>", function()
				local current_line = vim.fn.line(".")
				MiniComment.toggle_lines(current_line, current_line)
			end, { silent = true, noremap = true, desc = "Comment line" })

			-- Map Ctrl+/ for insert mode, keeps cursor in correct position
			vim.keymap.set("i", "<C-_>", function()
				local current_line = vim.fn.line(".")
				local cursor = vim.api.nvim_win_get_cursor(0)
				local line_content_before = vim.api.nvim_get_current_line()

				MiniComment.toggle_lines(current_line, current_line)

				local line_content_after = vim.api.nvim_get_current_line()
				local line_length_diff = #line_content_after - #line_content_before

				-- Adjust cursor position
				cursor[2] = cursor[2] + line_length_diff
				vim.api.nvim_win_set_cursor(0, cursor)
			end, { silent = true, noremap = true, desc = "Comment line" })
		end,
	},

	-- {
	-- 	"echasnovski/mini.files",
	-- 	config = function()
	-- 		require("mini.files").setup({
	-- 			mappings = {
	-- 				go_in = "L",
	-- 				go_out = "H",
	-- 				go_in_plus = "<CR>",
	-- 				go_out_plus = "-",
	-- 			},
	-- 		})
	--
	-- 		local MiniFiles = require("mini.files")
	--
	-- 		vim.keymap.set("n", "-", function()
	-- 			MiniFiles.open(vim.api.nvim_buf_get_name(0))
	-- 			MiniFiles.reveal_cwd()
	-- 		end, { silent = true, desc = "Open file browser" })
	--
	-- 		-- Create marks on MiniFilesExplorerOpen event
	-- 		local set_mark = function(id, path, desc)
	-- 			MiniFiles.set_bookmark(id, path, { desc = desc })
	-- 		end
	--
	-- 		vim.api.nvim_create_autocmd("User", {
	-- 			pattern = "MiniFilesExplorerOpen",
	-- 			callback = function()
	-- 				set_mark("c", vim.fn.stdpath("config"), "Config") -- path
	-- 				set_mark("w", vim.fn.getcwd, "Working directory") -- callable
	-- 				set_mark("~", "~", "Home directory")
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
