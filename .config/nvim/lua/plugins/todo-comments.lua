return {
	-- Highlight todos, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
			highlight = {
				after = "", -- only highlight keyword
			},
		},
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/Fix/Hack" },
			{ "<leader>sq", "<cmd>TodoQuickFix<cr>", desc = "Quickfix todo" },
		},
	},
}
