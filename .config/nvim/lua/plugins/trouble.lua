return {
	-- Better diagnostics
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{
				"<leader>xx",
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
				"grr",
				"<cmd>Trouble lsp_references toggle focus=true<cr>",
				desc = "LSP references (Trouble)",
			},
		},
	},
}
