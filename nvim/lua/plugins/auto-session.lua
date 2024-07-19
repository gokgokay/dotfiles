return {
	{
		"rmagatti/auto-session",
		keys = {
			{ "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session" },
			{ "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
			{ "<leader>qr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
		},
		opts = {
			log_level = "error",
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_session_pre_save_cmds = { "tabdo NvimTreeClose" }, -- close nvimtree before saving sessions
		},
		config = function(_, opts)
			local autosession = require("auto-session")
			autosession.setup(opts)
		end,
	},
}
