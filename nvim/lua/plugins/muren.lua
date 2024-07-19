return {
	{
		"AckslD/muren.nvim",
		config = function()
			require("muren").setup({
				-- ui sizes
				patterns_width = 50,
				patterns_height = 20,
				options_width = 30,
				preview_height = 12,
			})
		end,
		keys = {
			{ "<leader>cm", "<cmd>MurenToggle<cr>", desc = "Toggle muren" },
		},
	},
}
