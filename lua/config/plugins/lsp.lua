-- Define the list of LSP servers once
local lsp_servers = {
	"html",
	"cssls",
	"lua_ls",
	"pyright",
	"eslint",
	"ts_ls",
}

return {

	---------------------------------------------------------------------
	-- AUTOCOMPLETE (nvim-cmp)
	---------------------------------------------------------------------
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	---------------------------------------------------------------------
	-- MASON + LSP CONFIG
	---------------------------------------------------------------------
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = lsp_servers,
			automatic_installation = true,
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Function to set keymaps when LSP attaches
			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(opts) })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references", unpack(opts) })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", unpack(opts) })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(opts) })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename", unpack(opts) })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", unpack(opts) })
				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer", unpack(opts) })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", unpack(opts) })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", unpack(opts) })
				vim.keymap.set(
					"n",
					"<leader>e",
					vim.diagnostic.open_float,
					{ desc = "Show diagnostics (float)", unpack(opts) }
				)
			end

			-- Setup each server using the variable
			for _, server in ipairs(lsp_servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					flags = {
						debounce_text_changes = 150,
					},
				})
			end
		end,
	},

	---------------------------------------------------------------------
	-- External tools installer (formatters, linters)
	---------------------------------------------------------------------
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
