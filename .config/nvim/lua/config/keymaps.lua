local map = vim.keymap.set

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" }) -- file

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better switch to normal mode
map("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Window management
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically", remap = true })
map("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>ww", "<C-w>w", { desc = "Switch other window", remap = true })
map("n", "<leader>we", "<C-w>=", { desc = "Make equal windows width", remap = true })
map("n", "<leader>ws", "<C-w>x", { desc = "Swap window", remap = true })
map("n", "<leader>w<", "<C-w><", { desc = "Decrease window width", remap = true })
map("n", "<leader>w>", "<C-w>>", { desc = "Increase window width", remap = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Delete tab" })
-- map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
-- map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Text Editing
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Diagnostic movement
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	local severity_int = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity_int })
	end
end
map("n", "]d", diagnostic_goto(true), { desc = "Next diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev warning" })

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
