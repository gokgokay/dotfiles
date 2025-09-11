return {
	-- Theme setup
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				notify = true,
				treesitter = true,
				treesitter_context = true,
			},
			background = {
				light = "latte",
				dark = "macchiato",
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
