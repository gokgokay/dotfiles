return {
	{
		-- Note management
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Notes",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
				},
			},
		},
		keys = {
			{ "<leader>nn", ":ObsidianQuickSwitch<cr>", desc = "Quickly switch" },
			{ "<leader>ns", ":ObsidianSearch<cr>", desc = "Search notes" },
			{ "<leader>nt", ":ObsidianTags<cr>", desc = "Show tags" },
		},
	},
}
