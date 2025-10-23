local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Set leader to space
vim.g.mapleader = " "

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable treesitter folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.ui" },
	{ import = "plugins.editor" },
	{ import = "plugins.coding" },
	{ import = "plugins.coding.language" },
	{ import = "plugins.extras.coding" },
	{ import = "plugins.extras.editor" },
	{ import = "plugins.extras.ui" },
})
