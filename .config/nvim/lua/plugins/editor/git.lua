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
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
	},

	-- Git signs and hunk actions
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- next hunk
				local function nav_hunk_next()
					if vim.wo.diff then
						vim.cmd.normal({ "]g", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end

				-- previous hunk
				local function nav_hunk_prev()
					if vim.wo.diff then
						vim.cmd.normal({ "[g", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end

				-- navigation
				map("n", "]g", nav_hunk_next, { desc = "Next hunk" })
				map("n", "[g", nav_hunk_prev, { desc = "Previous hunk" })
			end,
		},
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gP", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
		},
	},
}
