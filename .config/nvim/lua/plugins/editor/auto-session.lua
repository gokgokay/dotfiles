return {
	-- Session management
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			bypass_save_filetypes = { "dashboard" },
			pre_save_cmds = { "tabdo NvimTreeClose" },
			close_filetypes_on_save = { "checkhealth", "iron" },
		},
		keys = {
			{ "<leader>qd", "<cmd>AutoSession delete<cr>", desc = "Delete session" },
			{ "<leader>qf", "<cmd>AutoSession search<cr>", desc = "Find session" },
			{ "<leader>qp", "<cmd>AutoSession deletePicker<cr>", desc = "Pick sesssion to delete" },
			{ "<leader>qr", "<cmd>AutoSession restore<cr>", desc = "Restore session" },
			{ "<leader>qs", "<cmd>AutoSession save<cr>", desc = "Save session" },
		},
	},
}
