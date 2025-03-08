return {
	-- Auto-format files
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
			typescriptreact = { "prettier" },
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ formatters = { "injected" } })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
	end,
}
