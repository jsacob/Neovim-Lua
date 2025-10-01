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

vim.keymap.set('n', '<leader>so', ':source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

require("mason").setup()
-- Lsp
require("lsp_settings").setup()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	--Lsp's and such
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'mason-org/mason-lspconfig.nvim'
	use 'mason-org/mason.nvim'
	--Themes
	use 'vague2k/vague.nvim'
end)



