# Tmux Setup  

## Relevant Files

- [.tmux.conf](.tmux.conf) - Tmux configuration file
- [Keymaps](.config/nvim/README.md) - All the keymaps I use 


## Setup

Install **Tmux:**
```bash
brew install tmux
```
Install **Tmux Plugin Manager (TPM):**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Copy the provided Tmux configuration into your .tmux.conf file:
```bash 
cp path/to/your/.tmux.conf ~/.tmux.conf
```
Install **Plugins**

- Start a new Tmux session or reload your existing Tmux session. Then press **prefix + I** (where prefix is set to **C-a** in this configuration) to install the plugins listed in your **.tmux.conf** file.


# Zsh Setup

## Relevant Files

- [.zshrc](.zshrc) - Zsh configuration file 


## Setup

This setup guide is for macOS users.

Install **Zsh:**
```bash
brew install zsh
```
Install **Oh My Zsh:**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Copy the provided Zsh configuration into your .zshrc file:
```bash
cp path/to/your/.zshrc ~/.zshrc
```

# Neovim Setup

## Relevant Files

- [.config/nvim](.config/nvim) - Neovim configuration files


## Setup

This setup guide is for macOS users.

Install **Homebrew**:
```bash 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install **iTerm2**:
```bash
brew install --cask iterm2
```
Install **Neovim**:
```bash
brew install neovim
```
For better font rendering in your terminal, install **Nerd Font**:
```bash 
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```
For efficient search capabilities, install **Ripgrep**:
```bash
brew install ripgrep
```

## Plugins 

### Plugin Manager

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager 


### Dependency For Other Plugins

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Library used by other plugins


### UI 

- [catppuccin/nvim](https://github.com/catppuccin/nvim) - Catppuccin colorscheme (macchiato)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Bufferline with tabpage integration
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Stylish vim.u
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - Noice for message, cmdline and popup
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - Stylish vim.notify
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) - Indentation scope highlighting
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove) - Buffer removing (unshow, delete, wipeout)


### Editor

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


### Formatting

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save


### Treesitter

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save


### LSP

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Plugin for managing LSP servers and other tools
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)) - Integration between Mason and `nvim-lspconfig`, ensuring LSP servers are installed
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Automatic installation of tools (e.g., linters, formatters)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Nvim LSP client
- [kosayoda/nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) - Displays a lightbulb sign when code actions are available


### Extras

- [andythigpen/nvim-coverage](https://github.com/andythigpen/nvim-coverage) - Display test coverage within Neovim
- [vim-test/vim-test](https://github.com/vim-test/vim-test) - Run tests within Neovim
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Auto-format specific file types on save.
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Library used by other plugins.
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua) - Fuzzy finder for Neovim with Lua integration.
- [AckslD/muren.nvim](https://github.com/AckslD/muren.nvim) - A plugin for managing and toggling Neovim's UI elements.
- [nvim-neorg/neorg](https://github.com/nvim-neorg/neorg) - Note-taking and organizational tool with support for various document formats and features.
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Seamlessly navigate between Vim and Tmux panes.
- [mrjones2014/smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) - Smart split resizing for Neovim.
- [mbbill/undotree](https://github.com/mbbill/undotree) - Visualize the undo history.
- [t9md/vim-quickhl](https://github.com/t9md/vim-quickhl) - Highlight words quickly and navigate between them.
- [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multi-cursor support for Vim.
- [danilamihailov/beacon.nvim](https://github.com/danilamihailov/beacon.nvim) - Highlight cursor when it moves.
- [linux-cultist/venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) - Choose what virtual environment to activate.
