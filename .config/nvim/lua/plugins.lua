return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- lsps
	use 'preservim/nerdtree'
 	use 'andweeb/presence.nvim'
	use	'neovim/nvim-lspconfig'
	use	'hrsh7th/cmp-nvim-lsp'
	use	'hrsh7th/nvim-cmp'
	use	'mason-org/mason-lspconfig.nvim'
	use	'mason-org/mason.nvim'
	use	'ray-x/lsp_signature.nvim'
	use	'nvim-telescope/telescope.nvim'
	use	'nvim-lua/plenary.nvim'
	use	'BurntSushi/ripgrep'
	use	'nvim-treesitter/nvim-treesitter'
	use	'sharkdp/fd'
 	use 'Mofiqul/vscode.nvim'
	use 'tpope/vim-obsession'
	use 'rose-pine/neovim'

end)
