return {
	-- Git UI
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
	},

	-- Git signs and hunk actions
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			yadm = { enable = true },
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
				end

				local function nav_hunk_next()
					if vim.wo.diff then
						vim.cmd.normal({ "]g", bang = true })
					else
						gs.nav_hunk("next")
					end
				end

				local function nav_hunk_prev()
					if vim.wo.diff then
						vim.cmd.normal({ "[g", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end

				-- Hunk navigation
				map("n", "]g", nav_hunk_next, "Next hunk")
				map("n", "[g", nav_hunk_prev, "Previous hunk")
			end,
		},
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gP", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
		},
	},
}
