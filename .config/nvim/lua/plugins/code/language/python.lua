return {
	-- Test runner with pytest
	{
		"vim-test/vim-test",
		ft = "python",
		config = function()
			vim.g["test#python#runner"] = "pytest"
		end,
	},
}
