return {
	-- Startup dashboard with shortcuts and logo
	{
		"nvimdev/dashboard-nvim",
		lazy = false,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		opts = function()
			local logo = [[
██╗   ██╗██╗███╗   ███╗
██║   ██║██║████╗ ████║
██║   ██║██║██╔████╔██║
╚██╗ ██╔╝██║██║╚██╔╝██║
 ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local menu = {
				{ icon = "󰏔 ", desc = " Update plugins", action = "Lazy update", key = "u" },
				{ icon = " ", desc = " Find file", action = "Telescope find_files", key = "f" },
				{ icon = " ", desc = " Recent files", action = "Telescope oldfiles", key = "r" },
				{ icon = " ", desc = " Search grep", action = "Telescope live_grep", key = "g" },
				{ icon = " ", desc = " Switch themes", action = "Telescope themes", key = "t" },
				{ icon = "󰒲 ", desc = " Lazy", action = "Lazy", key = "l" },
				{
					icon = " ",
					desc = " Quit",
					action = function()
						vim.api.nvim_input("<cmd>qa<cr>")
					end,
					key = "q",
				},
			}
			return {
				theme = "doom",
				config = {
					header = vim.split(logo, "\n"),
					center = menu,
				},
			}
		end,
	},
}
