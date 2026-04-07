vim.pack.add({
	"https://github.com/j-hui/fidget.nvim",

	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",

	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/folke/lazydev.nvim",
})

-- Misc LSP Settings

-- Hides tailwind css warnings
vim.lsp.config("cssls", {
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = true,
})

-- General LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = event.buf, desc = "LSP: Goto References" })
		vim.keymap.set(
			"n",
			"gri",
			telescope.lsp_implementations,
			{ buffer = event.buf, desc = "LSP: Goto Implementations" }
		)
		vim.keymap.set("n", "gd", telescope.lsp_definitions, { buffer = event.buf, desc = "LSP: Goto Definition" })
		vim.keymap.set(
			"n",
			"gO",
			telescope.lsp_document_symbols,
			{ buffer = event.buf, desc = "LSP: Open Document Symbols" }
		)
		vim.keymap.set(
			"n",
			"gW",
			telescope.lsp_dynamic_workspace_symbols,
			{ buffer = event.buf, desc = "LSP: Open Workspace Symbols" }
		)
		vim.keymap.set(
			"n",
			"grt",
			telescope.lsp_type_definitions,
			{ buffer = event.buf, desc = "LSP: Goto Type Definition" }
		)
		vim.keymap.set("n", "gdq", vim.diagnostic.setqflist, { desc = "LSP: Open Diagnostics Quickfix List" })

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hints" })
		end
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	float = { source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

-- Fidget (LSP status updates)
require("fidget").setup({
	notification = {
		window = {
			winblend = 0,
		},
	},
})
