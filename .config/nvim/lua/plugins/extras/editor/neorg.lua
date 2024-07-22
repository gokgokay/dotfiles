return {
	-- Note taking like org-mode in emacs
	{
		"nvim-neorg/neorg",
		lazy = false,
		ft = "norg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		build = function()
			vim.cmd("Neorg sync-parsers")
		end,
		opts = {
			highlight = {
				enable = true,
			},
			load = {
				["core.esupports.indent"] = {
					format_on_enter = true,
					format_on_escape = true,
				},
				["core.export"] = {},
				["core.export.markdown"] = {
					config = {
						extensions = "all",
					},
				},
				["core.defaults"] = {},
				["core.keybinds"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "varied",
						icons = {
							delimiter = {
								horizontal_line = {
									highlight = "@neorg.delimiters.horizontal_line",
								},
							},
							code_block = {
								content_only = true,
								width = "content",
								conceal = true,
								nodes = { "ranged_verbatim_tag" },
								highlight = "CursorLine",
								insert_enabled = true,
							},
						},
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		},
		config = function(_, opts)
			local neorg = require("neorg")
			neorg.setup(opts)
		end,
		keys = {
			{ "<leader>oe", "<cmd>Neorg export to-file<cr>", { desc = "Export file" } },
			{ "<leader>ot", "<cmd>Neorg tangle current-file<cr>", { desc = "Tangle file" } },
			{ "<leader>ol", "<cmd>Neorg toc left<cr>", { desc = "Open toc (left)" } },
			{ "<leader>or", "<cmd>Neorg toc right<cr>", { desc = "Open toc (right)" } },
			{ "<leader>ow", "<cmd>Neorg workspace notes<cr>", { desc = "Open workspaces" } },
		},
	},
}
