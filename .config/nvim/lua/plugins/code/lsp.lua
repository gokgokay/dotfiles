return {
	-- Manage LSP, linters, and formatters
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"stylua",
				"shfmt",
			},
		},
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		keys = {
			{
				"gR",
				function()
					vim.lsp.buf.rename()
				end,
				mode = "n",
				desc = "Rename word under cursor",
			},
		},
	},
}
