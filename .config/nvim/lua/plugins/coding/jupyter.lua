return {
	-- Repl
	"hkupty/iron.nvim",
	event = "VeryLazy",
	opts = {
		config = {
			repl_open_cmd = "vertical rightbelow 90 split",
		},
		keymaps = {
			toggle_repl = "<space>rr",
			send_file = "<space>rf",
			send_line = "<space>rl",
			send_code_block_and_move = "<space>rb",
			send_paragraph = "<space>rp",
			send_until_cursor = "<space>rt",
			restart_repl = "<space>rR",
			interrupt = "<space>ri",
			clear = "<space>rc",
			exit = "<space>rq",
		},
	},
}
