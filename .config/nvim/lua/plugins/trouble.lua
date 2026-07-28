return {
	-- Better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Workspace Diagnostics (Trouble)",
			},
			-- 💡 ÖNERİ: Kodda seçtiğin fonksiyonun/değişkenin nerelerde kullanıldığını listeler (Telescope'tan daha düzenlidir)
			{
				"<leader>gr",
				"<cmd>Trouble lsp_references toggle focus=true<cr>",
				desc = "LSP References (Trouble)",
			},
			-- 💡 ÖNERİ: Projedeki Quickfix listesini Trouble arayüzüyle açar
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
