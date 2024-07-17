return {
	-- Auto-format specific file types on save
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
				son = { "prettier" },
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
		})
		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 5000,
			})
		end, { desc = "Format buffer" })
	end,
}
