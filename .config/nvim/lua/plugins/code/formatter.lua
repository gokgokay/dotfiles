return {
	-- Autoformat
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
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
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
