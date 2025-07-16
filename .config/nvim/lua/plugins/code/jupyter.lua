return {
	"hkupty/iron.nvim",
	ft = { "python", "lua", "sh" },
	opts = function()
		local view = require("iron.view")
		local common = require("iron.fts.common")
		return {
			config = {
				scratch_repl = true,
				repl_open_cmd = view.right(100),
				repl_definition = {
					python = {
						command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
					},
					lua = {
						command = { "lua" },
						block_dividers = { "-- %%", "--%%" },
					},
					sh = {
						command = { "bash" },
					},
				},
				highlight = { italic = true },
				ignore_blank_lines = true,
			},
		}
	end,
	keys = {
		{
			"<leader>rc",
			function()
				require("iron.core").send_code_block()
			end,
			desc = "Send code block and move",
		},
		{
			"<leader>rf",
			function()
				require("iron.core").send_file()
			end,
			desc = "Send file to REPL",
		},
	},
	config = function(_, opts)
		require("iron.core").setup(opts)
	end,
}
