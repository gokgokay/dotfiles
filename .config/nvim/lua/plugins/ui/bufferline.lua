return {
	-- Buffer management
	{
		"akinsho/bufferline.nvim",
		dependencies = { "echasnovski/mini.bufremove" },
		event = "VimEnter",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		},
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<leader>bb", "<cmd>e #<cr>", desc = "Switch buffer" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
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
				desc = "Force delete buffer",
			},
		},
	},
}
