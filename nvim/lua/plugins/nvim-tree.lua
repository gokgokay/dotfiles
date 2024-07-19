return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle tree" },
			{ "<leader>E", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse tree" },
		},
		opts = {
			view = {
				width = 35,
			},
			filters = {
				dotfiles = false,
        custom = {
          ".pytest_cache",
          ".git",
          ".venv",
          "htmlcov",
          "__pycache__",
          ".DS_Store",
        },
			},
			renderer = {
				group_empty = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			git = {
				ignore = false,
			},
		},
		config = function(_, opts)
			local nvimtree = require("nvim-tree")
			nvimtree.setup(opts)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
