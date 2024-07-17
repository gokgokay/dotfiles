return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "echasnovski/mini.bufremove",
		event = "VeryLazy",
		opts = {
			options = {
				indicator = {
					icon = "▎",
					style = "icon",
				},
				mode = "buffers",
				show_buffer_icons = false,
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
						highlight = "Directory",
						text_align = "center",
						separator = true,
					},
				},
			},
		},
		config = function(_, opts)
			local bufferline = require("bufferline")
			local macchiato = require("catppuccin.palettes").get_palette("macchiato")
			opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = {
							-- bg = "",
						},
						background = {
							fg = macchiato.text,
						},
					},
				},
			})
			bufferline.setup(opts)
		end,
		keys = {
			{ "<s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "<leader>bb", "<cmd>e #<cr>", desc = "Switch buffer" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete left buffer" },
		},
	},
}
