local map = vim.keymap.set

-- Core
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader><space>", "ggVGy", { desc = "Copy entire buffer" })
map("i", "jk", "<esc>", { desc = "Exit insert mode" })
map("n", "noh", ":nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Move lines
map({ "n", "i" }, "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map({ "n", "i" }, "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Window management
map("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wv", "<C-w>v", { desc = "Vertical split" })
map("n", "<leader>wh", "<C-w>s", { desc = "Horizontal split" })
map("n", "<leader>ww", "<C-w>w", { desc = "Switch window" })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize sizes" })
map("n", "<leader>ws", "<C-w>x", { desc = "Swap window" })
map("n", "<leader>w<", "<C-w><", { desc = "Shrink window" })
map("n", "<leader>w>", "<C-w>>", { desc = "Grow window" })

-- Diagnostics
local function diag(next, sev)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	return function()
		go({ severity = sev and vim.diagnostic.severity[sev] })
	end
end
map("n", "]d", diag(true), { desc = "Next diagnostic" })
map("n", "[d", diag(false), { desc = "Prev diagnostic" })
map("n", "]e", diag(true, "ERROR"), { desc = "Next error" })
map("n", "[e", diag(false, "ERROR"), { desc = "Prev error" })
map("n", "]w", diag(true, "WARN"), { desc = "Next warning" })
map("n", "[w", diag(false, "WARN"), { desc = "Prev warning" })
