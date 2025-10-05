vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#00e1ff" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000", fg = "#ffffff" })

vim.cmd.colorscheme("vague")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.syntax = 'on'
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard="unnamedplus"

vim.keymap.set('n', '<leader>so', ':source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

require("plugins")

require("mason").setup()
require"lsp_signature".setup()

require("lsp.lsp_settings").setup()
require("config.telescope")



