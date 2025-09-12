return {
	-- Test runner with pytest
	{
		"vim-test/vim-test",
		ft = "python",
		config = function()
			vim.g["test#python#runner"] = "pytest"
		end,
	},

	-- Python debugging with debugpy
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			require("dap-python").setup(python)
		end,
	},

	-- IPython repl config
	{
		"hkupty/iron.nvim",
		ft = "python",
		opts = {
			config = {
				repl_definition = {
					python = {
						command = { "ipython", "--no-autoindent" },
						block_dividers = { "# %%", "#%%" },
					},
				},
			},
		},
	},
}
