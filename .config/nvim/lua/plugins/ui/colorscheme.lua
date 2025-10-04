return {
	-- Theme setup
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
			neotest = true,
			which_key = true,
			markdown = true,
			mason = true,
			fzf = true,
			flash = true,
			indent_blankline = { enabled = true },
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
}
