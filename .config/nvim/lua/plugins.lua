return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- lsps
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'mason-org/mason-lspconfig.nvim'
	use 'mason-org/mason.nvim'
	use 'ray-x/lsp_signature.nvim'
	-- telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'BurntSushi/ripgrep'
	use'nvim-treesitter/nvim-treesitter'
	use 'sharkdp/fd'
	-- themes
	use 'vague2k/vague.nvim'
end)
