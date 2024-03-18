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
			update_in_insert = true,
			severity_sort = true,
		})

		-- Mostly copied from Kickstart
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			-- Goto Definition
			nmap("gd", require("telescope.builtin").lsp_definitions)
			-- Go to reference
			nmap("gr", require("telescope.builtin").lsp_references)
			-- Go to implemnation
			nmap("gI", require("telescope.builtin").lsp_implementations)

			-- Hover
			nmap("K", vim.lsp.buf.hover)

			-- Signature
			nmap("<C-k>", vim.lsp.buf.signature_help)
		end

		require("mason").setup()
		require("mason-lspconfig").setup()

		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			volar = {
				vue = {},
			},

			mdx_analyzer = {
				mdx = {},
				filetypes = { "mdx" },
				args = { "--stdio" },
			},
		}

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})

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
