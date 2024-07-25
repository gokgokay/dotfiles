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
				name = "personal",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
			},
			{
				name = "work",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
			},
		},
	},
	keys = {
		{ "<leader>nb", ":ObsidianBacklinks<cr>", desc = "Show backlinks" },
		{ "<leader>nl", ":ObsidianLink<cr>", desc = "Link selection" },
		{ "<leader>nf", ":ObsidianFollowLink<cr>", desc = "Follow link" },
		{ "<leader>nn", ":ObsidianNew<cr>", desc = "Create a new note" },
		{ "<leader>ns", ":ObsidianSearch<cr>", desc = "Search notes" },
		{ "<leader>no", ":ObsidianQuickSwitch<cr>", desc = "Quickly switch" },
		{ "<leader>nO", ":ObsidianOpen<cr>", desc = "Open in app" },
		{ "<leader>nt", ":ObsidianTags<cr>", desc = "Show tags" },
		{ "<leader>nw", ":ObsidianWorkspace<cr>", desc = "Swtich workspaces" },
	},
}
