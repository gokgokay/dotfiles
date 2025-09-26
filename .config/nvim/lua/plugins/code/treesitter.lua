return {
	-- Syntax highlighting
	-- TODO:
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "TSUpdate", "TSInstall", "TSUninstall" },
		opts = {
			folds = {
				enable = true,
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = { "python" },
			},
			ensure_installed = {
				"python",
				"lua",
				"json",
				"html",
				"css",
				"yaml",
				"javascript",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"xml",
				"http",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
