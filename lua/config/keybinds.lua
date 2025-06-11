-- Located: .config/nvim/lua/config/keybind.lua Keybinds
-- Basic Keybinds
-- Leader Key is set in .config/nvim/lua/config/lazy.lua

vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>q', ':x<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>x', ':q!<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>f', ':%s/', {noremap = true})
vim.keymap.set('n', '<leader>e', ':Explore<CR>', {noremap=true})



