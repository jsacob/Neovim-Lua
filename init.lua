<<<<<<< HEAD
=======
-- colorscheme
>>>>>>> a647890 (NewTheme)
-- Entry Point ./config/nvim/init.lua
-- Required Files for Entry
require("config.lazy")
require("lazy").setup("plugins")
require("config.options")
require("config.keybinds")
<<<<<<< HEAD
-- LSP'S 
vim.lsp.enable('pyright')
=======
require("config.lsp")
-- LSP'S 

>>>>>>> a647890 (NewTheme)
