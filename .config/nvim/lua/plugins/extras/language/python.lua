return {
	-- Python virtual environment selector
	{
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python",
		},
		opts = {
			name = {
				".venv",
				"venv",
				"env",
				".env",
			},
		},
		keys = {
			{ "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select virtualenv" },
			{ "<leader>cV", "<cmd>VenvSelectCached<cr>", desc = "Select cached virtualenv" },
		},
	},

	-- Treesitter parsers for python
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "ninja", "rst" } },
	},

	-- Test runner with pytest integration
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#python#runner"] = "pytest"
		end,
	},

	-- Lsp and servers for python
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = { "pyright", "ruff" },
					automatic_installation = true,
				},
			},
		},
		opts = {
			servers = {
				pyright = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						pyright = {
							autoImportCompletion = true,
							disableOrganizeImports = false,
							useLibraryCodeForTypes = true,
						},
						python = {
							pythonPath = vim.fn.exepath("python3"),
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
							},
							ignore = { "*" },
						},
					},
				},
				ruff = {
					on_attach = function(client, _)
						client.server_capabilities.hoverProvider = false
					end,
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				lspconfig[server].setup(config)
			end
		end,
	},
}
