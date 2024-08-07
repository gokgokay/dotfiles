local lsp_servers = {
	"pyright",
	"lua_ls",
	"yamlls",
	"bashls",
	"dockerls",
	"jsonls",
	"cssls",
	"taplo",
	"ruff",
	"html",
}

local lint_servers = {
	"mypy",
	"ruff",
	"debugpy",
	"ansible-lint",
	"eslint_d",
	"prettier",
	"fixjson",
	"jq",
	"ruff",
	"stylua",
	"ast-grep",
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = lint_servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Define an on_attach function keybindings, etc.
			local on_attach = function(client, bufnr)
				-- Keybindings, etc.
			end

			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analaysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
						},
						ignore = { "*" },
					},
				},
			})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				severity_sort = false,
				float = true,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
			vim.keymap.set(
				"n",
				"<leader>D",
				"<cmd>Telescope diagnostics bufnr=0<CR>",
				{ desc = "Show buffer diagnostics" }
			)
		end,
	},
}
