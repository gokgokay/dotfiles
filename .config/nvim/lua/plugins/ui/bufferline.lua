return {
	-- Buffer management
	{
		"akinsho/bufferline.nvim",
		dependencies = { "echasnovski/mini.bufremove" },
		event = "VeryLazy",
		opts = function()
			local palette = require("catppuccin.palettes").get_palette("macchiato")
			local bufferline_hl = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "bold" },
				custom = {
					all = {
						fill = { bg = palette.mantle },
					},
				},
			})
			return {
				highlights = bufferline_hl,
				options = {
					diagnostics = "nvim_lsp",
					show_buffer_icons = true,
					enforce_regular_tabs = true,
					always_show_bufferline = false,
					show_close_icon = false,
					show_buffer_close_icons = false,
					separator_style = "thin",
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							highlight = "Directory",
							padding = 1,
						},
					},
				},
			}
		end,
		keys = {
			-- Buffer navigation
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			-- Buffer reordering
			{ "<leader>bmj", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
			{ "<leader>bmk", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
			-- Buffer management
			{ "<leader>bb", "<cmd>e #<cr>", desc = "Switch buffer" },
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete buffer",
			},
			{
				"<leader>bC",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Force close buffer",
			},
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},
}
