# My Dev Environment Files 🚀

## Tmux

### Setup

- [.tmux.conf](.tmux.conf) - Tmux Configuration File


### Features

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) - tmux plugin manager 
- [catppuccin/tmux](https://github.com/catppuccin/tmux) - catppuccin themes such as latte, frappe, macchiato and mocha
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Navigating between vim and tmux panes
- [tmux-plugins/tmux-fpp](https://github.com/tmux-plugins/tmux-fpp) - File explorer for tmux 


### Keymaps

#### Window Management

- `C-a c`: Create a new window.
- `C-a w`: List all windows.
- `C-a n`: Move to the next window.
- `C-a p`: Move to the previous window.
- `C-a ,`: Rename the current window.
- `C-a 0-9`: Select the window by number.

#### Pane Management

- `C-a V`: Split the window vertically.
- `C-a H`: Split the window horizontally.
- `C-a S`: Swap the active pane with the pane above.
- `C-a o`: Switch to the next pane.
- `C-a z`: Toggle pane zoom.
- `C-a x`: Kill the active pane.
- `C-h`: Navigate left
- `C-j`: Navigate down
- `C-k`: Navigate up
- `C-l`: Navigate right

#### Copy and Paste

- `C-a [`: Enter copy mode.
- `C-a `: Paste the most recent buffer.

#### General Operations

- `C-a d`: Detach from the session.
- `C-a $`: Rename the current session.
- `C-a :`: Enter command mode (e.g., to type commands like `kill-server`).
- `C-a t`: Show the clock and system information.
- `C-a ?`: List all key bindings.


## Neovim

### Setup


### Structure


### Features


### Keymaps

Space (SPC) is my Leader key.

#### Mix

- `<leader>h`: Clear search highlights
- `<leader>ut`: Switch themes
- `<leader>?`: Local keymaps

#### Buffers

- `<s-l>`: Next buffer
- `<s-h>`: Prev buffer
- `]b:` Next buffer 
- `[b`: Prev buffer 
- `]B`: Move next buffer 
- `]B`: Move prev buffer 
- `<s-b>`: Next buffer 
- `<leader>bb`: Switch buffer
- `<leader>bd`: Delete buffer 
- `<leader>bD`: Delete buffer force
- `<leader>bl`: Delete left buffer
- `<leader>bo`: Delete other buffers 
- `<leader>bp`: Toggle pin buffer 
- `<leader>bP`: Delete non-pinned buffers 
- `<leader>br`: Delete right buffer 

#### File/Find

- `<leader>fb`: Buffers 
- `<leader>fc`: String under cursor (cwd) 
- `<leader>ff`: Find files (root)
- `<leader>fh`: Help tags
- `<leader>fr`: Recent 
- `<leader>fs`: String (cwd) 
- `<leader>ft`: Find todos 

#### Search

- `<leader>s"`: Registers  
- `<leader>sa`: Auto commands  
- `<leader>sb`: Buffer  
- `<leader>sd`: Document diagnostics 
- `<leader>sc`: Command history  
- `<leader>sC`: Commands 
- `<leader>sd`: Document diagnostics 
- `<leader>sh`: Help pages 
- `<leader>sH`: Search highlight groups 
- `<leader>sk`: Keymaps 
- `<leader>sw`: Word (root) 
- `<leader>st`: Switch themes 

#### Window

- `<leader>wd`: Delete window 
- `<leader>we`: Make equal windows width  
- `<leader>wh`: Split window horizontally 
- `<leader>wm`: Toggle maximize window
- `<leader>ws`: Swap window 
- `<leader>wv`: Split window vertically 
- `<leader>ww`: Switch other window 

#### Git

- `<leader>gb`: Branches 
- `<leader>gc`: Commits 
- `<leader>gg`: Neogit 
- `<leader>gp`: Preview hunk
- `<leader>gP`: Preview hunk inline
- `<leader>gs`: Status 

#### Test

- `<leader>ta`: Test suite 
- `<leader>tc`: Run coverage 
- `<leader>tC`: Toggle coverage 
- `<leader>tg`: Test visit 
- `<leader>tl`: Test last 
- `<leader>ts`: Coverage summary 
- `<leader>tt`: Test nearest 
- `<leader>tT`: Test all files 

#### Org

- `<leader>oe`: Neorg export to file  
- `<leader>ol`: Neorg toc left
- `<leader>or`: Neorg toc right
- `<leader>ot`: Neorg tangle current-file
- `<leader>ow`: Neorg workspace notes

#### Quit/Session

- `<leader>qd`: Delete session
- `<leader>qq`: Quit all
- `<leader>qr`: Restore session 
- `<leader>qs`: Save session

#### Quickly-highlight

- `<S-n>`: Next highlight word 
- `<S-p>`: Prev highlight word 
- `]h`: Next highlight word 
- `[h`: Prev highlight word 
- `ghh`: Toggle Highlight word 
- `ghr`: Reset highlight words 

#### Tab

- `<leader><tab><tab>`: New tab
- `<leader><tab>d`: Delete tab 

#### Code

- `<leader>cf`: Format buffer
- `<leader>cl`: Trouble Lsp definitions   
- `<leader>cm`: Toggle muren   
- `<leader>cu`: Toggle undotree 

