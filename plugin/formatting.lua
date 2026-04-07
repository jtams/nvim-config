vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		go = { "gopls", lsp_format = "fallback" },

		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		vue = { "prettierd", "prettier", stop_after_first = true },
		gotmpl = { "prettierd", "prettier", stop_after_first = true },

		json = { "prettierd", "prettier", stop_after_first = true },
		jsonc = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },

		cpp = { "clangd" },
	},
})

-- Format on Save
-- Not using the built into to allow toggling formatting
local auto_format = true
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		if not auto_format then
			return
		end
		if not conform.format({ bufnr = args.buf }) then
			vim.lsp.buf.format()
		end
	end,
})

-- Add :AutoFormat command with an argument to control formatting
vim.api.nvim_create_user_command("FormatOnSave", function(input)
	local argument = input.args:lower()
	if argument == "true" or argument == "1" then
		auto_format = true
		print("Format on Save: enabled.")
	elseif argument == "false" or argument == "0" then
		auto_format = false
		print("Format on Save: disabled.")
	else
		print("Invalid argument. Use 'true' or 'false'.")
		return
	end
end, { nargs = 1 })

-- Adds keybind to format
vim.keymap.set("n", "<leader>ff", conform.format, { noremap = true, silent = true, desc = "Format file" })
vim.keymap.set("n", "<leader>ft", function()
	auto_format = not auto_format
	print("Format on Save: " .. (auto_format and "enabled" or "disabled") .. ".")
end, { desc = "Toggle format on save" })

-- Add :Format command
vim.api.nvim_create_user_command("Format", function()
	conform.format()
end, {})
