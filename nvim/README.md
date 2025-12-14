# About this config

  The current config aims at serving as a simple, but effective environment
to write simple projects in rust, c, c++, python and javascript.

---
# Current state

  The config is currently quite minimal, but functional enough that it could be used
for working on projects with reasonable ease.

---
## Available functionality

  Below a list of plugins that are included, or yet to be included, in the config. 

- [] Git support
- [x] autopairs (), {}, [], "", and so on.
- [] Harpoon
- [x] LSP integration
- [x] Autocompletion
- [x] Neotree
- [x] Treesitter
- [x] Telescope

----
## Core

  The core folder contains basic configuration files that set basic functionality and support all plugins
used in this config.

- Lazy manages all plugins and its UI can be called via `:Lazy` 
- Keymaps contains all the shorcuts used in the config that do not depend on plugins, for instance:
  CTRL + S whilst in normal or insert mode to save the current buffer
- Opts exposes the vim api and sets the values used in this config, for instance:
  sets leader, having [relative] lines numbers, search behaviour, UI, and so on
- Lsp contains the logic that controls the integration of language server protocols, like inlay hints and autocompletion.
  Refer to the LSP support section for further details.

----
## LSP support

  The LSPs used in this configuration are all contained in individual files inside `root/lsp`. 
 
  In order to add a new LSP, one must first download it manually through the terminal, as this configuration does not use `Mason`,
and then create the configuration file within the aforementioned folder. The LSP must finally be called by passing to the table
in `core/lsp.lua`.

  Inlay hints and highlighting and any other form of diagnostics configuration is contained in `root/core/lsp.lua`. Right now,
the configuration runs with default settings.

  A set of universal keymaps were added to the different LSPs that allow the user to jump to definitions/declarations and even
rename variables. A unviersal formatter keymap was also provided, but it it should be noted that it only works if supported by
the lsp.

  The table below represents the language servers that are currently supported in the present configuration.

- [x] Rust
- [x] Javascript
- [x] Typescript
- [x] C
- [x] C++
- [x] Python
- [x] Lua
- [x] Bash

-----
## Plugins

  The plugins folder contains all plugins that are used in the config. The plugins are called by lazy and loaded
automatically upon initialising NeoVim.

- Colorscheme contains whatever flavour of theme being used
- Lualine is a simple statusbar
- Nvim-tree is a file explorer
- Nvim-treesitter is a file parser that enables smart syntax highlighting, code navigation and editing featurs, amongst others
- Telescope makes it able to quickly jump to a file within a directory and grepping from a bunch of files in it
- Nvim-autopairs automatically adds matching paired-characters, such as "", {}, (), and so on. The cursor is automatically
  moved inside the matching pair
- Blink is a completion plugin that attaches to the LSP configuration. It works out-of-the-box
- Render-markdown renders a nicer view of markdown files
