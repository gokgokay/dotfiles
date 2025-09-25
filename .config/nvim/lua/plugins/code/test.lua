return {
	-- Easy test runner
	{
		"vim-test/vim-test",
		dependencies = { "preservim/vimux" },
		keys = {
			{ "<leader>tt", "<cmd>:TestNearest<cr>", desc = "Test nearest" },
			{ "<leader>tT", "<cmd>:TestFile<cr>", desc = "Test files" },
			{ "<leader>ta", "<cmd>:TestSuite<cr>", desc = "Test suite" },
			{ "<leader>tl", "<cmd>:TestLast<cr>", desc = "Test last" },
			{ "<leader>tg", "<cmd>:TestVisit<cr>", desc = "Test visit" },
		},
	},
}
