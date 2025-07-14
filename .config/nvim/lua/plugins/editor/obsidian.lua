return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim", "tpope/vim-markdown" },
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
