return {
	"hkupty/iron.nvim",
	event = "VeryLazy",
	opts = {
		config = {
			scratch_repl = true,
			repl_open_cmd = "vertical rightbelow 90 split",
			ignore_blank_lines = true,
		},
		keymaps = {
			toggle_repl = "<space>rr",
			send_file = "<space>rf",
			send_line = "<space>rl",
			send_code_block_and_move = "<space>rb",
			send_paragraph = "<space>rp",
			restart_repl = "<space>rR",
			interrupt = "<space>ri",
			clear = "<space>rc",
			exit = "<space>rq",
		},
	},
}
