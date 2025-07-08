return {
	-- Statusline customization
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		opts = function()
			return {
				options = {
					theme = "auto",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { statusline = { "dashboard", "alpha", "lazy" } },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "fileformat" },
					lualine_y = { "progress", "location" },
					lualine_z = { { "datetime", style = "%H:%M" } },
				},
				extensions = { "neo-tree", "nvim-tree", "toggleterm", "quickfix" },
			}
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
}
