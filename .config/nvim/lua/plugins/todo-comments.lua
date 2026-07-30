return {
	-- Highlight todos
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/Fix/Hack" },
			{ "<leader>sq", "<cmd>TodoQuickFix<cr>", desc = "Quickfix todo" },
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Prev todo",
			},
		},
	},
}
