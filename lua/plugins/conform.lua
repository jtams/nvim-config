-- Conform. Makes formatting easy
return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { { "gopls" } },
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettier" } },
				typescript = { { "prettier" } },
				json = { { "prettier" } },
				jsonc = { { "prettier" } },
				yaml = { { "prettier" } },
				markdown = { { "prettier" } },
				vue = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettier" } },
				typescriptreact = { { "prettier" } },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				cpp = { { "clangd" } },
			},
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_fallback = true,
			-- },
			notify_on_error = false,
		})

		-- Adds keybind to format
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ff",
			'<CMD>lua require("conform").format()<CR>',
			{ noremap = true, silent = true }
		)

		-- Add :Format command
		vim.api.nvim_create_user_command("Format", function()
			conform.format()
		end, {})

		local auto_format_enabled = true

		-- Format on save
		-- This is here so I can toggle it on and off which I can't do with conform's
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
			callback = function()
				if not auto_format_enabled then
					return
				end
				-- Try to format with Conform, use LSP Format as fallback
				if not conform.format() then
					vim.lsp.buf.format()
				end
			end,
		})

		-- Add :AutoFormat command with an argument to control formatting
		vim.api.nvim_create_user_command("FormatOnSave", function(input)
			local argument = input.args:lower()
			if argument == "true" or argument == "1" then
				auto_format_enabled = true
				print("Formatting on save is now enabled.")
			elseif argument == "false" or argument == "0" then
				auto_format_enabled = false
				print("Formatting on save is now disabled.")
			else
				print("Invalid argument. Use 'true' or 'false'.")
				return
			end
		end, { nargs = 1 })
	end,
}
