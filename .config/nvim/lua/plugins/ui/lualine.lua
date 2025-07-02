return {
	-- Statusline customization
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		opts = function()
			return {
				options = {
					theme = "auto",
					section_separators = { left = "", right = "" },
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = { "diagnostics", "filename" },
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
