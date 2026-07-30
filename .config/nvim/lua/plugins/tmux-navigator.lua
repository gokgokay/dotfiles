return {
	-- Tmux navigation
	"christoomey/vim-tmux-navigator",
	keys = {
		{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
	},
}
