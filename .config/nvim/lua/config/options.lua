vim.g.mapleader = " "
local opt = vim.opt

opt.cursorline = true -- Highlight current line
opt.relativenumber = true -- Relative line numbers
opt.number = true -- Absolute line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.wrap = false -- Disable line wrapping
opt.linebreak = true -- Wrap long lines visually
opt.showmode = false -- Hide mode in status line
opt.laststatus = 3 -- Always show global status line
opt.scrolloff = 4 -- Keep 4 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible when scrolling horizontally
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Indentation spaces
opt.tabstop = 2 -- Number of spaces a tab counts
opt.shiftround = true -- Round shifts to multiples of shiftwidth
opt.smartindent = true -- Auto-indent based on syntax
opt.smartcase = true -- Case-sensitive search if uppercase used
opt.ignorecase = true -- Ignore case in search
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open right
opt.undofile = true -- Persistent undo
opt.undolevels = 1000 -- Maximum undo levels
opt.autowrite = true -- Auto-save on buffer switch
opt.virtualedit = "block" -- Allow block-wise editing in virtual space
opt.inccommand = "nosplit" -- Preview substitutions
opt.jumpoptions = "view" -- Preserve view when jumping
opt.completeopt = "menu,menuone" -- Autocomplete options
opt.pumheight = 10 -- Popup menu max height
opt.pumblend = 10 -- Popup menu transparency
opt.termguicolors = true -- True color support
opt.mouse = "a" -- Enable mouse support

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.g.bigfile_size = 1024 * 1024 * 1.5 -- Threshold for large files
vim.g.markdown_recommended_style = 0 -- Disable recommended markdown styling
vim.g.autoformat = true -- Enable autoformat
vim.g.trouble_lualine = true -- Integrate Trouble with Lualine

vim.cmd("let g:netrw_liststyle = 3") -- Tree style file explorer
vim.cmd("let g:VM_theme = 'paper'") -- VM multi-cursor theme
