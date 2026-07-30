return {
	-- Code Formatter
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
			},
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({})
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
	},
}
