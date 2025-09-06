return {
	-- Better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		config = true,
		lazy = false,
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Buffer diagnostics",
			},
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		},
	},
}
