return {
	-- Choose what virtual environment to activate
	{
		"linux-cultist/venv-selector.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python",
		},
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts, {
				name = {
					".venv",
					"venv",
					"env",
					".env",
				},
			})
		end,
		keys = {
			{ "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select virtualenv" },
			{ "<leader>cV", "<cmd>VenvSelectCached<cr>", desc = "Select cached virtualenv" },
		},
	},
}
