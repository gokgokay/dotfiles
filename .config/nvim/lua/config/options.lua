vim.cmd("let g:netrw_liststyle = 3")

vim.g.mapleader = " "
local opt = vim.opt

opt.cursorline = true -- Highlight the current line
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Display absolute line numbers
opt.autowrite = true -- Auto-save when switching buffers
opt.completeopt = "menu,menuone" -- Autocomplete options for better suggestions
opt.conceallevel = 2 -- Conceal certain characters (like asterisks)
opt.confirm = true -- Confirm before closing modified buffers
opt.expandtab = true -- Convert tabs to spaces
opt.grepformat = "%f:%l:%c:%m" -- Format for grep results
opt.ignorecase = true -- Ignore case in searches
opt.inccommand = "nosplit" -- Preview substitutions in command mode
opt.jumpoptions = "view" -- Preserve view when jumping
opt.laststatus = 3 -- Always show the global status line
opt.linebreak = true -- Break long lines visually
opt.mouse = "a" -- Enable mouse support
opt.pumheight = 10 -- Max height for popup menu
opt.pumblend = 10 -- Transparency for popup menu
opt.scrolloff = 4 -- Keep 4 lines visible above/below cursor
opt.shiftround = true -- Round shifts to multiples of `shiftwidth`
opt.shiftwidth = 2 -- Spaces for each indentation level
opt.showmode = false -- Hide mode indicator in the status line
opt.sidescrolloff = 8 -- Keep 8 columns visible when scrolling horizontally
opt.signcolumn = "yes" -- Always show the sign column
opt.smartcase = true -- Enable case sensitivity if uppercase letters are used in search
opt.smartindent = true -- Auto-indent based on context
opt.splitbelow = true -- New horizontal splits open below current window
opt.splitright = true -- New vertical splits open to the right
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.termguicolors = true -- Enable true color support in terminal
opt.undofile = true -- Persistent undo across sessions
opt.undolevels = 1000 -- Maximum number of undos allowed
opt.updatetime = 200 -- Update time for events (e.g., CursorHold)
opt.virtualedit = "block" -- Allow block-wise editing in virtual space
opt.winminwidth = 5 -- Minimum width for any window
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync clipboard based on SSH
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " } -- Customize fill characters for UI elements
vim.g.markdown_recommended_style = 0 -- Disable recommended Markdown style settings
vim.g.autoformat = true -- Enable auto-formatting of files
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- Threshold for handling large files
vim.g.trouble_lualine = true -- Integrate Trouble plugin with Lualine for error display
vim.cmd("let g:netrw_liststyle = 3") -- Display files in tree style in Netrw
vim.api.nvim_command("autocmd! BufWinEnter * if &filetype == 'man' | wincmd _ | endif") -- Resize window for man pages
