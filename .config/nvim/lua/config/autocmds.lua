-- This file is automatically loaded by config.lua
local autocmd = vim.api.nvim_create_autocmd
local sethl = vim.api.nvim_set_hl
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Go to last loc when opening a buffer
autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Enable line wrapping and spell checking
autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "txt" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Close some filetypes with q or <esc>
autocmd("FileType", {
	pattern = {
		"checkhealth",
		"lspinfo",
		"lazy",
		"help",
		"notify",
		"NeogitStatus",
		"qf",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			local close_fn = function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end
			vim.keymap.set("n", "q", close_fn, {
				buffer = event.buf,
				silent = true,
			})
			vim.keymap.set("n", "<esc>", close_fn, {
				buffer = event.buf,
				silent = true,
			})
		end)
	end,
})

-- Move help buffer to the left side automatically
autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("wincmd H")
	end,
})

-- Disable indentscope, number and cursorline for the specific filetypes
autocmd("FileType", {
	pattern = {
		"NvimTree",
		"lazy",
		"help",
		"checkhealth",
		"git",
		"gitcommit",
		"lspinfo",
		"mason",
		"notify",
		"query",
		"Trouble",
		"toggleterm",
		"dashboard",
	},
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.cursorline = false
		vim.b.miniindentscope_disable = true
	end,
})

-- Custom highlights
autocmd({ "BufWinEnter", "ColorScheme" }, {
	group = augroup("colors"),
	pattern = { "*" },
	callback = function()
		local colors = require("catppuccin.palettes").get_palette()
		-- telescope
		sethl(0, "TelescopeResultsBorder", { fg = colors.surface1, bg = colors.base })
		sethl(0, "TelescopePreviewBorder", { fg = colors.surface1, bg = colors.base })
		sethl(0, "TelescopeBorder", { fg = colors.surface1, bg = colors.base })
		sethl(0, "TelescopePromptBorder", { fg = colors.surface1, bg = colors.base })
		sethl(0, "TelescopeResultsNormal", { fg = colors.text, bg = colors.base })
		sethl(0, "TelescopePromptNormal", { fg = colors.text, bg = colors.base })
		sethl(0, "TelescopePreviewNormal", { fg = colors.text, bg = colors.base })
		sethl(0, "TelescopePreviewTitle", { fg = colors.text, bg = colors.base })
		sethl(0, "TelescopeResultsTitle", { fg = colors.text, bg = colors.base })
		sethl(0, "TelescopeSelection", { fg = colors.text, bg = colors.surface0, bold = true })
		sethl(0, "TelescopeMatching", { fg = colors.peach })
		-- yank
		sethl(0, "YankHighlight", { fg = colors.crust, bg = colors.yellow })
		-- bufferline
		sethl(0, "BufferLineFill", { bg = colors.base })
	end,
})
