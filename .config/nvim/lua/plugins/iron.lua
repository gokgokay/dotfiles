return {
	-- Repl runner
	{
		"hkupty/iron.nvim",
		event = "VeryLazy",
		opts = {
			config = {
				repl_open_cmd = "vertical rightbelow 90 split",
				repl_definition = {
					python = {
						command = { "ipython", "--no-autoindent", "--TerminalInteractiveShell.confirm_exit=False" },
						block_dividers = { "# %%", "#%%" },
					},
					lua = {
						command = { "lua" },
						block_dividers = { "-- %%", "--%%" },
					},
				},
			},
			keymaps = {
				send_code_block_and_move = "<space>rb",
				send_file = "<space>rf",
				interrupt = "<space>ri",
				send_line = "<space>rl",
				toggle_repl = "<space>rr",
				exit = "<space>rq",
			},
		},
	},
}
