return {
	-- Run test easily
	{
		"vim-test/vim-test",
		ft = "python",
		dependencies = { "preservim/vimux" },
		keys = {
			{ "<leader>tt", "<cmd>:TestNearest<cr>", desc = "Test nearest" },
			{ "<leader>tT", "<cmd>:TestFile<cr>", desc = "Test all files" },
			{ "<leader>ta", "<cmd>:TestSuite<cr>", desc = "Test sutie" },
			{ "<leader>tl", "<cmd>:TestLast<cr>", desc = "Test last" },
			{ "<leader>tg", "<cmd>:TestVisit<cr>", desc = "Test visit" },
		},
	},
}
