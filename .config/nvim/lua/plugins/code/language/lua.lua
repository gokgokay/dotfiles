return {
	-- Lua REPL config
	{
		"hkupty/iron.nvim",
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
