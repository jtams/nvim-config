-- LSP
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- Adds Neovim lua signatures and stuff
		"folke/neodev.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("neodev").setup()
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = true, -- Inline diagnostic
			signs = true, -- Add signs in sign column
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Custom hover handler with border
		local function custom_hover()
			local bufnr = vim.api.nvim_get_current_buf()
			local params = vim.lsp.util.make_position_params()
			vim.lsp.buf_request(bufnr, "textDocument/hover", params, function(_, result, ctx, config)
				if not (result and result.contents) then
					return
				end
				local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
				markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
				if vim.tbl_isempty(markdown_lines) then
					return
				end
				local border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				}
				vim.lsp.util.open_floating_preview(markdown_lines, "markdown", {
					border = border,
					focusable = false,
				})
			end)
		end

		-- Mostly copied from Kickstart
		local on_attach = function(_, bufnr)
			local function safe_map(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr
				if type(rhs) == "string" or type(rhs) == "function" then
					vim.keymap.set(mode, lhs, rhs, opts)
				else
					print("Invalid rhs for keymap: " .. lhs)
				end
			end

			local telescope = require("telescope.builtin")

			-- Goto Definition
			safe_map("n", "gd", telescope.lsp_definitions, { buffer = bufnr, desc = "Go to definition" })

			-- Go to reference
			safe_map("n", "gr", telescope.lsp_references, { buffer = bufnr, desc = "Go to references" })

			-- Go to implemnation
			safe_map("n", "gI", telescope.lsp_implementations, { buffer = bufnr, desc = "Go to implementations" })

			-- Hover
			safe_map("n", "K", custom_hover, { buffer = bufnr, desc = "Show hover" })

			-- Signature
			safe_map("n", "L", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help" })

			-- Rename
			safe_map("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })

			-- Code actions
			safe_map("n", "<leader>da", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
			safe_map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
			-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
		end

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
