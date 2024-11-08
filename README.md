# Neovim Config

My neovim config

# Installation

`git clone https://github.com/jtams/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

# 2025 Config

- Moved comments, auto pairs, surround, and oil to mini.comments, mini.pairs, mini.surround, and mini.files
- Remapped rename symbol to F2
- Moved all diagnostic keybinds to start with <leader>d. <leader>dd to open Trouble
- <leader>da for code actions
- Ctrl+hjkl move between splits and Ctrl+arrow keys to resize
- <leader>ft to toggle format on save
- Moved signature help to Shift+L
- Removed grapple
- Added snipe for file switching keybind: ss
- Removed colorizer and colorpicker in favor of ccc.nvim
- Added multicursor
- <leader>hx to toggle hex editing, and binary files automatically open in hex

# Planned Changes/Research for 2025

- [x] Look into mini.nvim
- [x] Look into adding vim.lsp.buf.code_action() for "Fix Available" actions
- [x] Change the way I handle switching files. Possibly change my harpoon/grapple keybinds or use another plugin. [Snipe](https://github.com/leath-dub/snipe.nvim) looks cools. [Reference video](https://www.youtube.com/watch?v=ldfxEda_mzc).
- [ ] Look into debugging
- [ ] Look into switching from Copilot or changing plugins to include a chat.
- [x] Add descriptions to the keybinds
- [x] Change keybinds for surround or use different plugin
- [ ] Redo conform
- [x] Look for better plugin to display/pick colors
- [x] Find better keybinds for splits
- [x] Move file explorer to side
- [x] Better hex editing?
- [x] Better configuration for UFO
- [x] Go over telescope keybinds (and possible missed features)
- [x] [Multicursor](https://github.com/jake-stewart/multicursor.nvim)
