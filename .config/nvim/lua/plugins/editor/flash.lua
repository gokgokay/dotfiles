return {
	-- Quick search and jump
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					jump_labels = true,
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							mode = "exact",
						},
					})
				end,
				desc = "Flash Jump",
			},
		},
	},
}
