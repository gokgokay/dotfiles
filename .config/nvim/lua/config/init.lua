local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
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
