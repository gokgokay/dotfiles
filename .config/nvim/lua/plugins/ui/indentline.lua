return {
	--- Show scope guides for indentation
	{
		"echasnovski/mini.indentscope",
		enabled = true,
		opts = {
			symbol = "▏",
			options = { try_as_border = true },
			draw = {
				delay = 50,
				animation = function()
					return 10
				end,
			},
		},
		init = function()
			local disabled_ft = {
				"alpha",
				"dashboard",
				"help",
				"notify",
				"NvimTree",
				"neo-tree",
				"lazy",
				"checkhealth",
				"mason",
				"terminal",
				"Trouble",
				"toggleterm",
			}
			-- Disable indentscope for the specified filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = disabled_ft,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
