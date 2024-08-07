<img width="1795" alt="neovim-interface" src="https://github.com/user-attachments/assets/cb6e2553-82e9-4ead-a3fb-796fcbc879db">

# Terminal Setup
### Relevant Files
- [.zshrc](.zshrc) - Zsh configuration file
- [.tmux.conf](.tmux.conf) - Tmux Configuration File
### Requirements
- [homebrew](https://brew.sh/) - Package manager for macOS (or Linux)
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [zsh](https://formulae.brew.sh/formula/zsh) - Z shell
- [ohmyzsh](https://ohmyz.sh/) - Framework for managing Zsh configuration

1. **Backup your current terminal files:**
```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.zshrc ~/.zshrc.bak
```
2. **Clone the repository:**
```bash
git clone https://github.com/gokgokay/dotfiles.git ~/dotfiles
```
3. **Symlink the configuration files:**
```bash
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
```
4. **Install Nerd Font for better font rendering (optional):**
```bash
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```
5. **Install `ripgrep` for efficient search capabilities (optional):**
```bash
brew install ripgrep
```
6. **Install Tmux Plugin Manager (TPM):**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
7.  **Start Tmux and install plugins:**
	Launch tmux and press `prefix + I` (where prefix is set to **C-a** in this configuration) to fetch the plugin dependencies.

# Neovim Setup
###  Relevant Files
- [.config/nvim](.config/nvim) - Neovim configuration files
### Requirements
- [Neovim](https://neovim.io/) (Version 0.9 or Later)
- [Nerd Font](https://www.nerdfonts.com/) - Prefer to use Meslo Nerd Font
- [iTerm2](https://iterm2.com/): Prefer to use for true color
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope Fuzzy Finder

1. **Backup your current Neovim files:**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
2. **Clone the repository (skip if already done during terminal setup):**
```bash
git clone https://github.com/gokgokay/dotfiles.git ~/dotfiles
```
3. **Symlink the configuration files:**
```bash
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
```
4. **Remove the `.git` folder (optional):**
```bash
rm -rf ~/.config/nvim/.git
```
5. **Start Neovim:**
```bash
nvim
```
### Plugins
#### Plugin Manager
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager 
#### Dependency For Other Plugins
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Library used by other plugins
#### UI 
- [catppuccin/nvim](https://github.com/catppuccin/nvim) - Catppuccin colorscheme (macchiato)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Bufferline with tabpage integration
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Stylish vim.u
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - Noice for message, cmdline and popup
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - Stylish vim.notify
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) - Indentation scope highlighting
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove) - Buffer removing (unshow, delete, wipeout)
#### Editor
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Popup with possible key bindings of the command
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder over lists
- [rmagatti/auto-session](https://github.com/rmagatti/auto-session) - Session management
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight and search for todo comments
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - Lists to help you solve all code diagnostics
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent blank line
- [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit) - Managing git repositories directly within the editor
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git signs
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Complete parentheses
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - Surround text objects
#### Formatting
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save
#### Treesitter
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save
#### LSP
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Plugin for managing LSP servers and other tools
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)) - Integration between Mason and `nvim-lspconfig`, ensuring LSP servers are installed
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Automatic installation of tools (e.g., linters, formatters)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Nvim LSP client
- [kosayoda/nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) - Displays a lightbulb sign when code actions are available
#### Extras
- [andythigpen/nvim-coverage](https://github.com/andythigpen/nvim-coverage) - Display test coverage within Neovim
- [vim-test/vim-test](https://github.com/vim-test/vim-test) - Run tests within Neovim
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Library used by other plugins
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua) - Fuzzy finder for Neovim with Lua integration
- [AckslD/muren.nvim](https://github.com/AckslD/muren.nvim) - A plugin for managing and toggling Neovim's UI elements
- [nvim-neorg/neorg](https://github.com/nvim-neorg/neorg) - Note-taking and organizational tool with support for various document formats and features
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Seamlessly navigate between Vim and Tmux panes
- [mrjones2014/smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) - Smart split resizing for Neovim
- [mbbill/undotree](https://github.com/mbbill/undotree) - Visualize the undo history
- [t9md/vim-quickhl](https://github.com/t9md/vim-quickhl) - Highlight words quickly and navigate between them
- [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multi-cursor support for Vim
- [danilamihailov/beacon.nvim](https://github.com/danilamihailov/beacon.nvim) - Highlight cursor when it moves
- [linux-cultist/venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) - Choose what virtual environment to activate
# File Structure
<pre>
dotfiles/
├── .tmux.conf
├── .zshrc
└── .config
    └── nvim
        └── lua
            ├── helper
            │   ├── keymaps.lua
            │   ├── lazy.lua
            │   ├── options.lua
            │   └── util.lua
            └── plugins
                └── ***
        └── init.lua

</pre>
