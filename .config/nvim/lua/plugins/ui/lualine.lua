return {
	-- Statusline customization
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		opts = {
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = {
						"dashboard",
						"lazy",
						"mason",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename" } },
				lualine_x = { "diagnostics", "filetype" },
				lualine_y = { "encoding", "fileformat" },
				lualine_z = { "location", "progress" },
			},
			extensions = {
				"nvim-tree",
				"nvim-dap-ui",
				"mason",
				"lazy",
				"trouble",
			},
		},
	},
}
