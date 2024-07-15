return {
	-- Highlight words quickly
	{
		"t9md/vim-quickhl",
		keys = {
			{ "]h", "<Plug>(quickhl-manual-go-to-next)", mode = { "n", "x" }, desc = "Next highlighted word" },
			{ "[h", "<Plug>(quickhl-manual-go-to-prev)", mode = { "n", "x" }, desc = "Prev highlighted word" },
			{ "ghh", "<Plug>(quickhl-manual-this)", mode = { "n", "x" }, desc = "Highlight word" },
			{ "ghr", "<Plug>(quickhl-manual-reset)", mode = { "n", "x" }, desc = "Reset highlighted words" },
		},
	},
}
