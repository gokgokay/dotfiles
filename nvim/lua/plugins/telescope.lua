return {
	-- Fuzzy finder over lists
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
		keys = {
			{ "<leader>/", "<cmd>Telescope search_history<cr>", desc = "Search history" },
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "String under cursor (cwd)" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (root)" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "String (cwd)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
			-- search
			{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search highlight groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", { word_match = "-w" }, desc = "Word (root)" },
			{ "<leader>ut", "<cmd>Telescope themes<cr>", { enable_preview = true }, desc = "Switch themes" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					layout_strategy = "horizontal",
					path_display = { "truncate" },
					layout_config = {
						prompt_position = "bottom",
						horizontal = {
							height = 0.85,
						},
					},
					pickers = {
						find_files = {
							find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
						},
						man_pages = {
							theme = "dropdown",
						},
						buffers = {
							sort_lastused = true,
							theme = "dropdown",
							previewer = true,
							mappings = {
								i = {
									["<C-d>"] = actions.delete_buffer + actions.move_to_top,
								},
							},
						},
						current_buffer_fuzzy_find = {
							previewer = false,
						},
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-b>"] = actions.preview_scrolling_up,
						},
						n = {
							["esc"] = actions.close,
						},
					},
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
						fzy_native = {
							override_generic_sorter = false,
							override_file_sorter = true,
						},
						smart_open = {
							match_algorithm = "fzf",
							disable_devicons = false,
						},
						themes = {
							enable_live_preview = true,
							persist = {
								enabled = false,
								path = vim.fn.stdpath("config") .. "/lua/helper/colorscheme.lua",
							},
						},
					},
				},
			}
		end,
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
