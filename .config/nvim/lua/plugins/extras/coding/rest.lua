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
		dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim", "j-hui/fidget.nvim" },
		keys = {
			{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run nearest request" },
			{ "<leader>rl", "<cmd>Rest run last<cr>", desc = "Run last request" },
		},
		config = function(_, opts)
			local rest = require("rest-nvim")
			rest.setup(opts)
		end,
	},
}
