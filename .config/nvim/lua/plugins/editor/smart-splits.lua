return {
	-- Window resizing
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		keys = {
			{ "<A-Right>", "<cmd>SmartResizeRight<cr>", desc = "Resize window right" },
			{ "<A-Up>", "<cmd>SmartResizeUp<cr>", desc = "Resize window up" },
			{ "<A-Down>", "<cmd>SmartResizeDown<cr>", desc = "Resize window down" },
			{ "<A-Left>", "<cmd>SmartResizeLeft<cr>", desc = "Resize window left" },
		},
	},
}
