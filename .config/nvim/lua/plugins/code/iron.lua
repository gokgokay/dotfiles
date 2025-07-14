return {
	{
		"Vigemus/iron.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					-- Your repl definitions come here

					repl_definition = {
						python = require("iron.fts.python").ipython,
						scala = require("iron.fts.scala").scala,
					},
					-- How the repl window will be displayed
					-- See below for more information
					repl_open_cmd = require("iron.view").right("50%"),
				},
				-- If the highliht is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			}
		end,
    -- stylua: ignore
    keys = {
      { "<leader>x", function() end, mode = {"n", "x"}, desc = "+REPL" },
      { "<leader>xm", function() end, mode = {"n", "x"}, desc = "+Mark" },
      { "<leader>xs", function() require("iron.core").run_motion("send_motion") end, desc = "Send Motion" },
      { "<leader>xs", function() require("iron.core").visual_send() end, mode = {"v"}, desc = "Send" },
      { "<leader>xl", function() require("iron.core").send_line() end, desc = "Send Line" },
      { "<leader>xt", function() require("iron.core").send_until_cursor() end, desc = "Send Until Cursor" },
      { "<leader>xf", function() require("iron.core").send_file() end, desc = "Send File" },
      { "<leader>xL", function() require("iron.marks").clear_hl() end, mode = {"v"}, desc = "Clear Highlight" },
      { "<leader>x<cr>", function() require("iron.core").send(nil, string.char(13)) end, desc = "ENTER" },
      { "<leader>xI", function() require("iron.core").send(nil, string.char(03)) end, desc = "Interrupt" },
      { "<leader>xC", function() require("iron.core").close_repl() end, desc = "Close REPL" },
      { "<leader>xc", function() require("iron.core").send(nil, string.char(12)) end, desc = "Clear" },
      { "<leader>xms", function() require("iron.core").send_mark() end, desc = "Send Mark" },
      { "<leader>xmm", function() require("iron.core").run_motion("mark_motion") end, desc = "Mark Motion" },
      { "<leader>xmv", function() require("iron.core").mark_visual() end, mode = {"v"}, desc = "Mark Visual" },
      { "<leader>xmr", function() require("iron.marks").drop_last() end, desc = "Remove Mark" },
      { "<leader>xR", "<cmd>IronRepl<cr>", desc = "REPL" },
      { "<leader>xS", "<cmd>IronRestart<cr>", desc = "Restart" },
      { "<leader>xF", "<cmd>IronFocus<cr>", desc = "Focus" },
      { "<leader>xH", "<cmd>IronHide<cr>", desc = "Hide" },
    },
		config = function(_, opts)
			local iron = require("iron.core")
			iron.setup(opts)
		end,
	},
}
