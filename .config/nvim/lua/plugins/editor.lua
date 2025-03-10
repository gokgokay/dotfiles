return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			view = {
				width = 35,
			},
			filters = {
				dotfiles = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle tree" },
			{ "<leader>E", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse tree" },
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
	},

	-- Remove buffer (unshow, delete, wipeout)
	{
		"echasnovski/mini.bufremove",
		version = false,
	},

	-- Quick search and jump
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},

	-- Manage session
	{
		"rmagatti/auto-session",
		opts = {
			pre_save_cmds = {
				"tabdo NvimTreeClose",
				"tabdo TroubleClose",
			},
		},
		keys = {
			{ "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session" },
			{ "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
			{ "<leader>qr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
      { "<leader>qf", "<cmd>SessionSearch<cr>", desc = "Find session" }
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
		end,
	},

	-- Highlight and search todo comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/Fix/Hack" },
		},
	},

	-- Manage git repositories
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
		opts = {
			integrations = {
				diffview = true,
			},
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
	},

	-- Displays code changes
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		opts = {
			yadm = { enable = true },
		},
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gP", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
		},
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
					-- Navigation
					map("n", "]g", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]g", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)
					map("n", "[g", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[g", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)
				end,
			})
		end,
	},

	-- Manage diagnostics
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Buffer diagnostics",
			},
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		},
	},

	-- Popup with possible key bindings of the command
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				rules = false,
			},
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				{ "g", group = "goto" },
				{ "gh", group = "highlights" },
				{ "<leader><tab>", group = "tabs" },
				{ "<leader>b", group = "buffers" },
				{ "<leader>bm", group = "move" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>n", group = "notes" },
				{ "<leader>r", group = "rest" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "test" },
				{ "<leader>w", group = "window" },
				{ "<leader>u", group = "ui" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>x", group = "diagnostics" },
				-- Hide keymaps
				{ "<leader>e", hidden = true },
				{ "<leader>E", hidden = true },
				{ "<leader>h", hidden = true },
				{ "<leader>l", hidden = true },
				{ "<leader>?", hidden = true },
				{ "<leader>/", hidden = true },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Local keymaps",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

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
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
			-- search
			{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root)" },
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
