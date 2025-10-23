return {
	-- Autoformat
	{
		"stevearc/conform.nvim",
		event = { "VeryLazy" },
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
				graphql = { "prettier" },
				svelte = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
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
