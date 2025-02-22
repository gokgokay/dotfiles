return {
	-- Highlight indentation levels
	{
		"echasnovski/mini.indentscope",
		enabled = true,
		opts = {
			symbol = "╎",
			draw = {
				delay = 50,
				animation = function()
					return 10
				end,
			},
		},
		init = function()
			-- disable indentscope for the current filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"alpha",
					"dashboard",
					"help",
					"mason",
					"notify",
					"NvimTree",
					"neo-tree",
					"lazy",
					"checkhealth",
					"mason",
					"terminal",
					"toggleterm",
					"Trouble",
					"toggleterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Custom configuration with catppuccin theme
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = function()
			local catppuccin = require("lualine.themes.catppuccin")
			catppuccin.normal.c.bg = ""
			return {
				options = {
					theme = catppuccin,
					section_separators = { left = "", right = "" },
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "diagnostics", "filename" },
					lualine_x = { "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "" },
				},
			}
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},

	-- Enhances UI
	{
		"stevearc/dressing.nvim",
		lazy = true,
	},

	-- Enhances Neovim with custom notifications
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
			render = "minimal",
			timeout = 3000,
		},
	},

	-- Replaces Neovim's UI for messages and cmdline
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- enables classic bottom cmdline for search
				command_palette = true, -- positions the cmdline and popupmenu together
				long_message_to_split = true, -- sends long messages to a split view
				inc_rename = true, -- enables an input dialog for incremental renaming
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
		},
		config = function(_, opts)
			if vim.o.filetype == "lazy" then
				vim.cmd([[messages clear]])
			end
			require("noice").setup(opts)
		end,
	},

	-- Manage buffers
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
						all = {
							fill = { bg = "#1e2031" }, -- Sets background color to macchiato
						},
						macchiato = {
							background = { fg = macchiato.text }, -- Sets foreground to macchiato text color
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
							highlight = "Directory",
						},
					},
				},
			}
		end,
		keys = {
			{ "<s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
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
				desc = "Delete buffer (Force)",
			},
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin buffer" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete left buffer" },
		},
		config = function(_, opts)
			vim.opt.termguicolors = true
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},

	-- Dashboard with custom logo and shortcuts
	{
		"nvimdev/dashboard-nvim",
		lazy = false,
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		opts = function()
			local logo = [[
        ███████╗██╗  ██╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
        ██╔════╝██║ ██╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
        ███████╗█████╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
        ╚════██║██╔═██╗   ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
        ███████║██║  ██╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚══════╝╚═╝  ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{
							action = "Lazy update",
							desc = " Update plugins",
							icon = "󰏔 ",
							key = "u",
						},
						{
							action = "Telescope find_files",
							desc = " Find file",
							icon = " ",
							key = "f",
						},
						{
							action = "Telescope oldfiles",
							desc = " Recent files",
							icon = " ",
							key = "r",
						},
						{
							action = "Telescope live_grep",
							desc = " Search grep",
							icon = " ",
							key = "g",
						},
						{
							action = "Telescope themes",
							desc = " Switch themes",
							icon = " ",
							key = "t",
						},
						{
							action = "Lazy",
							desc = " Lazy",
							icon = "󰒲 ",
							key = "l",
						},
						{
							action = function()
								vim.api.nvim_input("<cmd>qa<cr>")
							end,
							desc = " Quit",
							icon = " ",
							key = "q",
						},
					},
				},
			}
			return opts
		end,
	},
}
