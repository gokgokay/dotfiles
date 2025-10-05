return {
	-- Quick search and jump
	{
		"folke/flash.nvim",
		event = "VeryLazy",
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
