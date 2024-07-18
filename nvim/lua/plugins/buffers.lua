return {
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
		config = function(_, opts)
			local bufferline = require("bufferline")
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
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete buffer (Force)" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete left buffer" },
		},
	},
}
