return {
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
				{ "gh", group = "highlights" },
				{ "<leader><tab>", group = "tabs" },
				{ "<leader>b", group = "buffers" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>o", group = "org" },
				{ "<leader>om", group = "metadata" },
				{ "<leader>oo", group = "toc" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "test" },
				{ "<leader>w", group = "window" },
				{ "<leader>u", group = "ui" },
				{ "<leader>x", group = "diagnostics" },
				-- hide keymaps
				{ "<leader>e", hidden = true },
				{ "<leader>E", hidden = true },
				-- { "<leader>h", hidden = true },
				{ "<leader>l", hidden = true },
				-- { "<leader>?", hidden = true },
				{ "<leader>/", hidden = true },
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
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
		end,
	},
}
