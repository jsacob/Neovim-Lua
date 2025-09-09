vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.termguicolors = true
vim.cmd.colorscheme("vague")
--vim.cmd([[highlight Normal guibg=none ctermbg=none]])

vim.opt.relativenumber = true
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
vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<leader>n', ':bNext<CR>')
vim.keymap.set('n', '<leader>p', ':bprevious<CR>')
vim.keymap.set('n', '<leader>mg', ':!glow %<CR>', { noremap = true, silent = true })
-- Keymap to toggle markdown preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'vague2k/vague.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'm4xshen/autoclose.nvim'
    use 'joshdick/onedark.vim'
    use 'andweeb/presence.nvim'
    use 'folke/flash.nvim'
    use 'datsfilipe/vesper.nvim'
    use 'nvim-tree/nvim-tree.lua'
	use 'iamcco/markdown-preview.nvim'

    -- Treesitter for markdown + latex
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Markdown preview with LaTeX math support
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = "cd app && npm install",
    --     ft = { "markdown" },
    -- })

    -- Vimtex for LaTeX support (optional but recommended)
    use 'lervag/vimtex'
end)

require("autoclose").setup({
    keys = {
        ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
    },
})

-- Mason and LSP config
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "marksman", "texlab" }, -- added marksman & texlab
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
        end,
    }
})

-- clangd config
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

-- NVIM-TREE
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Treesitter setup for markdown + latex
require("nvim-treesitter.configs").setup {
    ensure_installed = { "markdown", "latex" },
    highlight = { enable = true },
}

-- Markdown preview config
vim.g.mkdp_auto_start = 0      -- Don't auto-start preview, toggle manually
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 1
vim.g.mkdp_open_to_the_world = 0

-- Vimtex config (optional)
vim.g.vimtex_view_method = 'zathura'  -- or 'skim' on macOS, or your PDF viewer
vim.g.vimtex_compiler_method = 'latexmk'


