return {
	-- Test runner
	{
		"vim-test/vim-test",
		dependencies = { "preservim/vimux" },
		config = function()
			-- run tests in tmux pane
			vim.g["test#strategy"] = "neovim"
			-- use pytest for python
			vim.g["test#python#runner"] = "pytest"
		end,
		keys = {
			{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test all" },
			{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test nearest" },
			{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
			{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
			{ "<leader>tg", "<cmd>TestVisit<cr>", desc = "Visit test file" },
		},
	},
}
