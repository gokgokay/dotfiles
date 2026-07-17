return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
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
			renderer = {
				-- show only folder name
				root_folder_label = ":t",
			},
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle tree" },
		},
	},
}
