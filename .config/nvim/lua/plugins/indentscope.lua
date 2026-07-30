return {
	-- Show scope guides for indentation
	{
		"nvim-mini/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "╎",
			options = {
				try_as_border = true,
			},
			draw = {
				delay = 50,
				animation = function()
					return 10
				end,
			},
		},
	},
}
