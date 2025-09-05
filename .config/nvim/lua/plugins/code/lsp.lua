return {
	-- Lsp config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("config.lsp").setup()
		end,
	},

	-- Manage lsp, linters, and formatters
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			max_concurrent_installers = 10,
		},
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},

	-- Auto-configuring installed LSP servers
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {},
	},

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup {}
    end,
  },

	-- Auto-install lsp, linters and formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = require("config.mason"),
	},
}
