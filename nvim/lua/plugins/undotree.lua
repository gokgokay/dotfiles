return {
	{
		"mbbill/undotree",
    init = function()
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
		keys = {
			{ "<leader>cu", "<cmd>UndotreeToggle<cr>", mode = "n", silent = true, desc = "Toggle undotree" },
		},
	},
}
