vim.cmd.colorscheme("rose-pine-moon")

-- vim.cmd [[
--   highlight StatusLine guibg=#000000 guifg=#cdd6f4
-- ]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.syntax = 'on'
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard="unnamedplus"

local map = vim.keymap.set
map('n', '<leader>so', ':source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>cs', ':nohlsearch<CR>')
map('n', '<leader><Tab>', ':ToggleTerm<CR>')

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>ch', builtin.command_history)
map('n', '<leader>cd', builtin.diagnostics)
map('n', '<leader>cc', builtin.commands)

--git
map('n', '<leader>gdp', ':VGit project_diff_preview<CR>', { noremap = true, silent = true })
map('n', '<leader>gbp', ':VGit buffer_history_preview<CR>', { noremap = true, silent = true })
map('n', '<leader>ga', ':Git add .<CR>', { noremap = true, silent = true })
map('n', '<leader>gp', ':Git push <CR>', { noremap = true, silent = true })


require("autoclose").setup({
   keys = {
      ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
   },
})

require("plugins")

require("mason").setup()
require"lsp_signature".setup()

require("lsp.lsp_settings").setup()
require("config.telescope")
require('vgit').setup()

require("config.toggleterm");

-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', 'j', 'jzz', opts)
-- vim.keymap.set('n', 'k', 'kzz', opts)
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
