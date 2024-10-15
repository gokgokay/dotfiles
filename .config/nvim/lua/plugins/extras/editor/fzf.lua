return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local map = require("config.util").Map
		local fzf = require("fzf-lua")
		require("fzf-lua").setup({
			"fzf-native",
			winopts = {
				preview = {
					default = "bat",
					vertical = "down:60%",
					layout = "vertical",
				},
			},
		})
		fzf.register_ui_select()
		map({ "n", "v", "i" }, "<C-x><C-f>", function()
			require("fzf-lua").complete_path()
		end, { silent = true, desc = "Fuzzy complete path" })
		-- find
		-- map("n", "<leader><leader>", fzf.files, { desc = "Find files" })
		-- map("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
		-- map("n", "<leader>fo", fzf.oldfiles, { desc = "Old files" })
		-- map("n", "<leader>ff", fzf.files, { desc = "Find Files (Root Dir)" })
		-- map("n", "<leader>fh", fzf.tags, { desc = "Help Tags" })
		-- map("n", "<leader>fg", fzf.live_grep_native, { desc = "Live Grep" })
		-- git
		-- map("n", "<leader>gC", fzf.git_commits, { desc = "Commits" })
		-- map("n", "<leader>gc", fzf.git_bcommits, { desc = "Buffer Commits" })
		-- map("n", "<leader>gs", fzf.git_status, { desc = "Status" })
		-- search
		-- map("n", '<leader>s"', fzf.registers, { desc = "Registers" })
		-- map("n", "<leader>sa", fzf.autocmds, { desc = "Auto Commands" })
		-- map("n", "<leader>sc", fzf.command_history, { desc = "Command History" })
		-- map("n", "<leader>sC", fzf.commands, { desc = "Commands" })
		-- map("n", "<leader>wd", fzf.diagnostics_document, { desc = "Document Diagnostics" })
		-- map("n", "<leader>sH", fzf.highlights, { desc = "Search Highlight Groups" })
		-- map("n", "<leader>wD", fzf.diagnostics_workspace, { desc = "Workspace Diagnostics" })
		-- map("n", "<leader>sh", fzf.helptags, { desc = "Help Pages" })
		-- map("n", "<leader>sk", fzf.keymaps, { desc = "Key Maps" })
		-- map("n", "<leader>sM", fzf.manpages, { desc = "Man Pages" })
		-- map("n", "<leader>sm", fzf.marks, { desc = "Jump to Mark" })
		-- map("n", "<leader>sR", fzf.resume, { desc = "Resume" })
		-- map("n", "<leader>st", fzf.colorschemes, { desc = "Color Schemes" })
	end,
}
