return {
	-- By highlighting indentation levels
	{
		"echasnovski/mini.indentscope",
		enabled = true,
		opts = {
			symbol = "▏",
			options = {
				try_as_border = true,
			},
			draw = {
				animation = function()
					return 0
				end,
			},
		},
		init = function()
			-- disable indentscope for the current filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"alpha",
					"dashboard",
					"help",
					"mason",
					"notify",
					"NvimTree",
					"neo-tree",
					"lazy",
					"checkhealth",
					"mason",
					"terminal",
					"toggleterm",
					"Trouble",
				},
				callback = function()
					vim.b.miniindentscope_disable = true end,
			})
		end,
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

	-- Buffer removing (unshow, delete, wipeout)
	{
		"echasnovski/mini.bufremove",
		version = false,
	},

	-- Bufferline with tabpage integration
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "echasnovski/mini.bufremove",
		opts = function()
			local macchiato = require("catppuccin.palettes").get_palette("macchiato")
			return {
				highlights = require("catppuccin.groups.integrations.bufferline").get({
					styles = { "italic", "bold" },
					custom = {
						macchiato = {
							background = { fg = macchiato.text },
						},
					},
				}),
				options = {
					mode = "buffers",
					enforce_regular_tabs = true,
					show_buffer_icons = true,
					show_close_icon = false,
					show_buffer_close_icons = false,
					always_show_bufferline = false,
					diagnostics = "nvim_lsp",
					max_name_length = 18,
					max_prefix_length = 15,
					tab_size = 18,
					separator_style = "thin",
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
						},
					},
				},
			}
		end,
		keys = {
			{ "<s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "<leader>bb", "<cmd>e #<cr>", desc = "Switch buffer" },
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete buffer (Force)",
			},
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete left buffer" },
		},
		config = function(_, opts)
			local bufferline = require("bufferline")
			bufferline.setup(opts)
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local catppuccin = require("lualine.themes.catppuccin")
			catppuccin.normal.c.bg = ""
			require("lualine").setup({
				options = {
					theme = catppuccin,
					section_separators = {
						left = "",
						right = "",
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- Stylish vim.u
	{
		"stevearc/dressing.nvim",
		lazy = true,
	},

	-- Noice for message, cmdline and popup
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		config = function(_, opts)
			if vim.o.filetype == "lazy" then
				vim.cmd([[messages clear]])
			end
			require("noice").setup(opts)
		end,
	},

	-- Stylish vim.notify
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
			render = "minimal",
			timeout = 3000,
		},
	},
}
