return {
	-- Session management
	{
		"rmagatti/auto-session",
		opts = {
			bypass_save_filetypes = { "alpha", "dashboard" },
		},
		keys = {
			{ "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
			{ "<leader>qf", "<cmd>SessionSearch<cr>", desc = "Find session" },
			{ "<leader>qr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
			{ "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session" },
		},
	},
}
