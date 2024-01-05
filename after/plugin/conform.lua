-- Conform

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { { "gopls" } },
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		vue = { { "prettierd", "prettier" } },
		jsx = { { "prettierd", "prettier" } },
		tsx = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		cpp = { { "clangd" } },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
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
