vim.cmd.colorscheme("vscode")

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
map('n', '<leader>.', ':NERDTreeToggle<CR>')

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>gc', builtin.git_commits)
map('n', '<leader>ch', builtin.command_history)

require("plugins")

require("mason").setup()
require"lsp_signature".setup()

require("lsp.lsp_settings").setup()
require("config.telescope")



