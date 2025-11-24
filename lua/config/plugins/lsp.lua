-- Define the list of LSP servers once
local lsp_servers = {
	"html",
	"cssls",
	"lua_ls",
	"pyright",
	"eslint",
}

return {
	-- LSP installer + config
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = lsp_servers, -- use the variable here
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
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Function to set keymaps when LSP attaches
			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
			end

			-- Setup each server using the variable
			for _, server in ipairs(lsp_servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
				})
			end
		end,
	},

	-- External tools installer (formatters, linters)
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
