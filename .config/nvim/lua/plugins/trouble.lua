return {
	-- Better diagnostics
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				errors = {
					mode = "diagnostics",
					filter = { severity = vim.diagnostic.severity.ERROR },
				},
				symbols = {
					win = { position = "bottom", size = 0.3 },
				},
				lsp = {
					win = { position = "bottom", size = 0.3 },
				},
			},
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble errors toggle focus=true<cr>",
				desc = "Errors",
			},
			{
				"<leader>xb",
				"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
				desc = "Buffer diagnostics",
			},
			{
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "Workspace diagnostics",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle focus=true<cr>",
				desc = "Quickfix list",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=true<cr>",
				desc = "Symbols outline",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=true<cr>",
				desc = "LSP definitions",
			},
		},
	},
}
