return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", desc = "Todo/Fix" },
			{ "<leader>sT", "<cmd>TodoTelescope<cr>", desc = "All Todos" },
		},
	},
}
