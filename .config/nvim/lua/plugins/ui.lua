return {
	-- Highlight indentation levels
	{
		"echasnovski/mini.indentscope",
		enabled = true,
		opts = {
			symbol = "▏",
			options = { try_as_border = true },
			draw = {
				delay = 0,
				animation = function(s)
					return math.floor(s * 1)
				end,
			},
		},
		init = function()
			local disabled_ft = {
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
			}
			-- Disable indentscope for the current filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = disabled_ft,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Custom configuration with catppuccin theme
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		opts = function()
			local palette = require("lualine.themes.catppuccin")
			palette.normal.c.bg = ""
			return {
				options = {
					theme = palette,
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

	-- Improved UI for input and select dialogs
	{
		"stevearc/dressing.nvim",
		lazy = true,
	},

	-- Modern and minimal notification system
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
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
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
			-- Buffer navigation
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			-- Buffer reordering
			{ "<leader>bmj", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
			{ "<leader>bmk", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
			-- Buffer management
			{ "<leader>bb", "<cmd>e #<cr>", desc = "Switch buffer" },
			{
				"<leader>bc",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Close buffer",
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
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close left buffer" },
		},
		config = function(_, opts)
			vim.opt.termguicolors = true
			require("bufferline").setup(opts)
			-- Auto-refresh bufferline on buffer changes
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
