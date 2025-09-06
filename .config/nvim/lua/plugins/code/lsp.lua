return {
	-- Lsp config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("config.lsp").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			max_concurrent_installers = 10,
		},
		keys = { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
	},

	-- Auto-install lsp, linters and formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = require("config.mason"),
	},
}
