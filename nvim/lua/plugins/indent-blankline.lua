return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = { char = "▏" },
			scope = { show_start = false, show_end = false },
			exclude = {
				buftypes = {
					"nofile",
					"prompt",
					"quickfix",
					"terminal",
				},
				filetypes = {
					"aerial",
					"alpha",
					"dashboard",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"NvimTree",
					"neogitstatus",
					"notify",
					"startify",
					"toggleterm",
					"Trouble",
				},
			},
		})
	end,
}
