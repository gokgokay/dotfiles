return {
	-- Show scope guides for indentation
	"echasnovski/mini.indentscope",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
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
}
