return {
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope", "TodoTelescope" },
		dependencies = {
			"folke/todo-comments.nvim",
			"nvim-lua/plenary.nvim",
			"andrew-george/telescope-themes",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					layout_strategy = "horizontal",
					path_display = { "truncate" },
					layout_config = {
						prompt_position = "bottom",
					},
					pickers = {
						find_files = {
							find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
						},
						buffers = {
							sort_lastused = true,
						},
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-d>"] = actions.preview_scrolling_up,
						},
						n = {
							["Esc"] = actions.close,
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
							persist = {
								enabled = false,
								path = vim.fn.stdpath("config") .. "/lua/config/colorscheme.lua",
							},
						},
					},
				},
			}
		end,
		keys = {
			{ "<leader>/", "<cmd>Telescope search_history<cr>", desc = "Search history" },
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find config file (cwd)" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (root)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
			-- search
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root)" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>ut", "<cmd>Telescope themes<cr>", { enable_preview = true }, desc = "Switch themes" },
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
			telescope.load_extension("frecency")
			telescope.load_extension("ui-select")
		end,
	},
}
