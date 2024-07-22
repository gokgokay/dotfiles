return {
	-- Display test coverage within Neovim
	{
		"andythigpen/nvim-coverage",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("coverage").setup()
		end,
		keys = {
			{ "<leader>tc", "<cmd>Coverage<cr>", desc = "Run coverage" },
			{ "<leader>tC", "<cmd>CoverageToggle<cr>", desc = "Toggle coverage" },
			{ "<leader>ts", "<cmd>CoverageSummary<cr>", desc = "Coverage summary" },
		},
	},
}
