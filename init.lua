-- Entry Point ./config/nvim/init.lua
require("config.lazy")
require("lazy").setup("plugins")
require("config.options")
require("config.keybinds")
require("config.lsp")
local lspconfig = require('lspconfig')

