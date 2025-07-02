return {
  -- Buffer management
  {
		"akinsho/bufferline.nvim",
		dependencies = { "echasnovski/mini.bufremove" },
		event = "VeryLazy",
		after = "catppuccin",
		opts = function()
			local palette = require("catppuccin.palettes").get_palette("macchiato")
			local bufferline_hl = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = palette.mantle },
					},
					macchiato = {
						background = { fg = palette.text },
					},
				},
			})
			return {
				highlights = bufferline_hl,
				options = {
					diagnostics = "nvim_lsp",
					enforce_regular_tabs = true,
					always_show_bufferline = false,
					show_buffer_icons = true,
					show_close_icon = false,
					show_buffer_close_icons = false,
					max_name_length = 18,
					max_prefix_length = 15,
					tab_size = 18,
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
			-- buffer navigation
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			-- buffer reordering
			{ "<leader>bmj", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
			{ "<leader>bmk", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
			-- buffer management
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
				desc = "Forse close buffer",
			},
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
		},
		config = function(_, opts)
			vim.opt.termguicolors = true
			require("bufferline").setup(opts)
			-- auto-refresh bufferline on buffer changes
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	}
}
