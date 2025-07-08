return {
	-- Minimal UI notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			stages = "static",
			render = "minimal",
			timeout = 3000,
		},
	},
}
