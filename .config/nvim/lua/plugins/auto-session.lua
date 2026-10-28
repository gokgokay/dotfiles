return {
	-- Session management
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			allowed_dirs = { "~/dotfiles/**", "~/dev/*" },
			suppressed_dirs = { "~/", "~/Downloads", "~/Desktop" },
			pre_save_cmds = { "tabdo NvimTreeClose" },
			bypass_save_filetypes = { "dashboard" },
			close_filetypes_on_save = { "checkhealth", "iron" },
		},
		keys = {
			{ "<leader>qd", "<cmd>AutoSession delete<cr>", desc = "Delete session" },
			{ "<leader>qf", "<cmd>AutoSession search<cr>", desc = "Find session" },
			{ "<leader>qp", "<cmd>AutoSession deletePicker<cr>", desc = "Pick session to delete" },
			{ "<leader>qr", "<cmd>AutoSession restore<cr>", desc = "Restore session" },
			{ "<leader>qs", "<cmd>AutoSession save<cr>", desc = "Save session" },
			{ "<leader>qt", "<cmd>AutoSession toggle<cr>", desc = "Toggle autosave" },
		},
	},
}
