vim.o.termguicolors = true
vim.cmd.colorscheme("onedark")
vim.cmd([[highlight Normal guibg=none ctermbg=none]])

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shell = 'zsh'
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.syntax = 'on'
vim.opt.visualbell = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.showmatch = true

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>fifr', ':%s/')
vim.keymap.set('n', '<leader>so', ':source<CR>')
vim.keymap.set('n', '<leader>ot', ':terminal<CR>')

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
	use 'vague2k/vague.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'm4xshen/autoclose.nvim'
	use 'joshdick/onedark.vim'
end)

require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
	},
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls" },
	handlers = {
		function(server)
			require('lspconfig')[server].setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						diagnostics = { globals = { 'vim' } },
						workspace = { library = { vim.env.VIMRUNTIME } }
					}
				},
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})
		end
	}
})

require("lspconfig").clangd.setup({
	cmd = { "/nix/store/g1zsg6imkxm4k53gywnkvklypnyc2kmw-system-path/bin/clangd" },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	float = { border = "rounded" },
})

local cmp = require('cmp')
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = { expand = function() end },
})

local function transparent_popup()
	vim.cmd([[
    highlight Pmenu guibg=NONE ctermbg=NONE
    highlight PmenuSel guibg=NONE ctermbg=NONE
    highlight PmenuSbar guibg=NONE ctermbg=NONE
    highlight PmenuThumb guibg=NONE ctermbg=NONE
  ]])
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = transparent_popup,
})

transparent_popup()
