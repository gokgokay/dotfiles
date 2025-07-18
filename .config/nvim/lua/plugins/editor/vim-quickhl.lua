return {
	-- Highlight words quickly
	{
		"t9md/vim-quickhl",
		event = "VeryLazy",
		keys = {
			{ "gh", "<Plug>(quickhl-manual-this)", mode = { "n", "x" }, desc = "Highlight words" },
			{ "gH", "<Plug>(quickhl-manual-reset)", mode = { "n", "x" }, desc = "Reset highlighted words" },
			{ "<S-n>", "<Plug>(quickhl-manual-go-to-next)", mode = { "n", "x" }, desc = "Next highlighted word" },
			{ "<S-p>", "<Plug>(quickhl-manual-go-to-prev)", mode = { "n", "x" }, desc = "Prev highlighted word" },
		},
	},
}
