return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
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
		{ "<leader>nb", ":ObsidianBacklinks<cr>", desc = "Show backlinks" },
		{ "<leader>nf", ":ObsidianFollowLink<cr>", desc = "Follow link" },
		{ "<leader>nl", ":ObsidianLink<cr>", desc = "Link selection" },
		{ "<leader>nn", ":ObsidianQuickSwitch<cr>", desc = "Quickly switch" },
		{ "<leader>nN", ":ObsidianNew<cr>", desc = "Create a new note" },
		{ "<leader>nO", ":ObsidianOpen<cr>", desc = "Open in app" },
		{ "<leader>ns", ":ObsidianSearch<cr>", desc = "Search notes" },
		{ "<leader>nt", ":ObsidianTags<cr>", desc = "Show tags" },
		{ "<leader>nw", ":ObsidianWorkspace<cr>", desc = "Switch workspaces" },
	},
}
