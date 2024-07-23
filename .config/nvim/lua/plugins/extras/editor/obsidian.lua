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
		{ "<leader>nb", ":ObsidianBacklinks<cr>", desc = "Obsidian backlinks" },
		{ "<leader>nl", ":ObsidianLink<cr>", desc = "Obsidian link selection" },
		{ "<leader>nf", ":ObsidianFollowLink<cr>", desc = "Obsidian follow link" },
		{ "<leader>nn", ":ObsidianNew<cr>", desc = "Obsidian new" },
		{ "<leader>ns", ":ObsidianSearch<cr>", desc = "Obsidian search" },
		{ "<leader>no", ":ObsidianQuickSwitch<cr>", desc = "Obsidian open quickswitch" },
		{ "<leader>nO", ":ObsidianOpen<cr>", desc = "Obsidian open in app" },
		{ "<leader>nt", ":ObsidianTags<cr>", desc = "Obsidian tags" },
		{ "<leader>nw", ":ObsidianWorkspace<cr>", desc = "Obsidian workspace" },
	},
}
