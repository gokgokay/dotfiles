return {
	-- Highlight and search for todo comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/fix/hack" },
			{
				"]T",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "next todo",
			},
			{
				"[T",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "previous todo",
			},
		},
	},
}
