return {
	-- Note management
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault/",
				},
			},
			templates = {
				folder = "99-Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
			},
		},
		keys = {
			{ "<leader>nn", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quickly switch" },
			{ "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
			{ "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "Show tags" },
			{ "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open in app" },
			{ "<leader>np", "<cmd>ObsidianTemplate<cr>", desc = "Insert template" },
		},
	},
}
