return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			view = {
				width = 35,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = { git = true, diagnostics = true },
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle tree" },
		},
	},
}
