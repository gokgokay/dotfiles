return {
	-- Run tests within NeoVim
	{
		"vim-test/vim-test",
		dependencies = {
			"preservim/vimux",
		},
		config = function()
			-- Set the Python test runner to pytest
			vim.g["test#python#runner"] = "pytest"
		end,
		keys = {
			{ "<leader>tt", "<cmd>:TestNearest<cr>", desc = "Test nearest" },
			{ "<leader>tT", "<cmd>:TestFile<cr>", desc = "Test all files" },
			{ "<leader>ta", "<cmd>:TestSuite<cr>", desc = "Test sutie" },
			{ "<leader>tl", "<cmd>:TestLast<cr>", desc = "Test last" },
			{ "<leader>tg", "<cmd>:TestVisit<cr>", desc = "Test visit" },
		},
	},
}
