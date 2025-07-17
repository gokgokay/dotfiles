return {
	-- Python debugging with debugpy
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		lazy = true,
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			require("dap-python").setup(python)
		end,
	},

	-- Python virtual environment selector
	{
		"linux-cultist/venv-selector.nvim",
		version = "*",
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
					automatic_enable = false,
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
			for server, server_opts in pairs(opts.servers) do
				lspconfig[server].setup(server_opts)
			end
		end,
	},
}
