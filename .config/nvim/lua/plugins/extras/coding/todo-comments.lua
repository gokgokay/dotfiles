return {
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		-- event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/Fix/Hack" },
			{ "<leader>sq", "<cmd>TodoQuickFix<cr>", desc = "Quickfix todos" },
		},
		config = function()
			require("todo-comments").setup()
		end,
	},
}
