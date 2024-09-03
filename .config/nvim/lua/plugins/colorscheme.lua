return {
	{
		"catppuccin/nvim",
		lazy = true,
		priority = 1000,
		name = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
