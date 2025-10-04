return {
	-- Buffer management
	"akinsho/bufferline.nvim",
	dependencies = { "echasnovski/mini.bufremove" },
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
	keys = {
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
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
			desc = "Force delete buffer",
		},
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
		{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
	},
}
