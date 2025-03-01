return {
	-- Auto-format specific file
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
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
				require("conform").format({
					async = true,
					timeout_ms = 3000,
				})
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
