return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Code
	use	'neovim/nvim-lspconfig'
	use	'hrsh7th/cmp-nvim-lsp'
 	use 'andweeb/presence.nvim'
	use	'hrsh7th/nvim-cmp'
	use	'mason-org/mason-lspconfig.nvim'
	use	'mason-org/mason.nvim'
	use	'ray-x/lsp_signature.nvim'
	use 'm4xshen/autoclose.nvim'
	use 'barrett-ruth/live-server.nvim'
	-- Tools
	use	'nvim-lua/plenary.nvim'
	use	'BurntSushi/ripgrep'
	use	'nvim-treesitter/nvim-treesitter'
	use	'sharkdp/fd'
	use 'akinsho/toggleterm.nvim'
	-- Git
	use 'tpope/vim-fugitive'
	use 'tanvirtin/vgit.nvim'
	-- Nav
	use	'nvim-telescope/telescope.nvim'
	-- Theme
	use 'rose-pine/neovim'
end)
