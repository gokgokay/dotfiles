return {
	-- Sh REPL config
	{
		"hkupty/iron.nvim",
		opts = {
			config = {
				repl_definition = {
					sh = {
						command = { "bash" },
					},
				},
			},
		},
	},
}
