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
				dotfiles = false,
				custom = {
					".pytest_cache",
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
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle tree" },
			{ "<leader>E", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse tree" },
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
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>o", group = "org" },
				{ "<leader>om", group = "metadata" },
				{ "<leader>oo", group = "toc" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "test" },
				{ "<leader>w", group = "window" },
				{ "<leader>u", group = "ui" },
				{ "<leader>x", group = "diagnostics" },
				-- hide keymaps
				{ "<leader>e", hidden = true },
				{ "<leader>E", hidden = true },
				-- { "<leader>h", hidden = true },
				{ "<leader>l", hidden = true },
				-- { "<leader>?", hidden = true },
				{ "<leader>/", hidden = true },
			},
		},
		config = function(_, opts)
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Local keymaps",
			},
		},
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
							["<C-b>"] = actions.preview_scrolling_up,
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
	},

	-- Session management
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_session_pre_save_cmds = { "tabdo NvimTreeClose" }, -- close nvimtree before saving sessions
		},
		config = function(_, opts)
			local autosession = require("auto-session")
			autosession.setup(opts)
		end,
		keys = {
			{ "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session" },
			{ "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
			{ "<leader>qr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
		},
	},

	-- Highlight and search for todo comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,HACK<cr>", desc = "Todo/fix/hack" },
			{
				"]T",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "next todo",
			},
			{
				"[T",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "previous todo",
			},
		},
	},

	-- Lists to help you solve all code diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		config = true,
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Document diagnostics",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "[Trouble] LSP Definitions / references /...",
			},
		},
	},

	-- Indent blank line
	{
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
	},

	-- Managing git repositories directly within the editor
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			disable_signs = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = false,
			integrations = {
				diffview = true,
			},
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		opts = {
			yadm = { enable = true },
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
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)
				end,
			})
		end,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gP", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
		},
	},

	-- Complete parentheses
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = "hrsh7th/nvim-cmp",

		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				check_ts = true,
				enable_check_bracket_line = false,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
