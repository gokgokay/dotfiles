return {
	-- Lua repl config
	{
		"hkupty/iron.nvim",
		ft = "lua",
		opts = {
			config = {
				repl_definition = {
					lua = {
						command = { "lua" },
						block_dividers = { "-- %%", "--%%" },
					},
				},
			},
		},
	},
}
