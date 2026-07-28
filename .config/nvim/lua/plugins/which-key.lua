return {
	-- Popup with possible key bindings of the command
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				rules = false,
			},
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				{ "g", group = "goto" },
				{ "<leader>b", group = "buffers" },
				{ "<leader>c", group = "code" },
				{ "<leader>d", group = "debug" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>n", group = "notes" },
				{ "<leader>r", group = "jupyter" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "test" },
				{ "<leader>w", group = "window" },
				{ "<leader>u", group = "ui" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>x", group = "diagnostics" },

				-- hide keymaps
				{ "<leader>l", hidden = true },
				{ "<leader>?", hidden = true },
				{ "<leader>/", hidden = true },
				{ "<leader><space>", hidden = true },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Local keymaps",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}
