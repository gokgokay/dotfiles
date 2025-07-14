return {
	-- Auto pairs 
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = "hrsh7th/nvim-cmp",
		opts = {
			check_ts = true,
			enable_check_bracket_line = false,
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			autopairs.setup(opts)

			-- cmp integration
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
