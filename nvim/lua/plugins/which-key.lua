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
				{ "g", desc = "goto" },
				{ "gh", desc = "highlights" },
				{ "<leader><tab>", desc = "tabs" },
				{ "<leader>b", desc = "buffers" },
				{ "<leader>c", desc = "code" },
				{ "<leader>f", desc = "find" },
				{ "<leader>g", desc = "git" },
				{ "<leader>o", desc = "org" },
				{ "<leader>om", desc = "metadata" },
				{ "<leader>oo", desc = "toc" },
				{ "<leader>s", desc = "search" },
				{ "<leader>t", desc = "test" },
				{ "<leader>w", desc = "window" },
				{ "<leader>u", desc = "ui" },
				{ "<leader>x", desc = "error" },
        -- hide keymaps
				{ "<leader>e", hidden = true },
				{ "<leader>l", hidden = true },
				{ "<leader>?", hidden = true },
				{ "<leader>/", hidden = true },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "local keymaps",
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
