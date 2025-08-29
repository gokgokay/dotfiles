return {
	-- Notes management
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		workspaces = {
			{
				name = "Notes",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
			},
		},
	},
	keys = {
		{ "<leader>on", ":ObsidianNew<cr>", desc = "New note" },
		{ "<leader>oo", ":ObsidianQuickSwitch<cr>", desc = "Quickly switch" },
		{ "<leader>os", ":ObsidianSearch<cr>", desc = "Search notes" },
		{ "<leader>ot", ":ObsidianTags<cr>", desc = "Show tags" },
	},
}
