return {
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/todo-comments.nvim",
			"andrew-george/telescope-themes",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					path_display = { "truncate" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-d>"] = actions.preview_scrolling_down,
							["<C-f>"] = actions.preview_scrolling_up,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					themes = {
						enable_live_preview = true,
					},
				},
			}
		end,
		keys = {
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "String under cursor (cwd)" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
			-- search
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>ut", "<cmd>Telescope themes<cr>", desc = "Switch themes" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzy_native")
			telescope.load_extension("themes")
			telescope.load_extension("ui-select")
		end,
	},
}
