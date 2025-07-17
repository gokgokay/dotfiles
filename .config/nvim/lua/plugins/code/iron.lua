return {
	"hkupty/iron.nvim",
	ft = { "python", "lua", "sh" },
	opts = {
		config = {
			scratch_repl = true,
			repl_open_cmd = "vertical rightbelow 100 split",
			highlight = { italic = true },
			ignore_blank_lines = true,
		},
		keymaps = {
			toggle_repl = "<space>rr",
			restart_repl = "<space>rR",
			send_motion = "<space>rc",
			visual_send = "<space>rC",
			send_file = "<space>rf",
			send_line = "<space>rl",
			send_paragraph = "<space>rp",
			send_code_block = "<space>rb",
			send_code_block_and_move = "<space>rn",
			mark_motion = "<space>rc",
			mark_visual = "<space>rc",
			cr = "<space>rs<cr>",
			interrupt = "<space>rs<space>",
			exit = "<space>rq",
			clear = "<space>rl",
		},
	},
}
