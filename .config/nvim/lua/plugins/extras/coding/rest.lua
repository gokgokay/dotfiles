return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		keys = {
			{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run nearest request" },
			{ "<leader>rl", "<cmd>Rest run last<cr>", desc = "Run last request" },
		},
		opts = {
			result = {
				split = {
					show_headers = true,
					format = true,
					horizontal = true,
					stay_in_current_window_after_split = false,
				},
			},
		},
		config = function(_, opts)
			local rest = require("rest-nvim")
			rest.setup(opts)
		end,
	},
}
