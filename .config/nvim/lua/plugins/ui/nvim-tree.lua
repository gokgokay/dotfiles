return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			view = {
				width = 35,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "toggle tree" },
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
}
