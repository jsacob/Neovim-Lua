-- Located: .config/nvim/lua/plugins/plug.lua

return {

 {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'deep'
    }
    -- Enable theme
    require('onedark').load()
  end
},
	
-- Small Single Packges 
{
	"mbbill/undotree",
    "nvim-treesitter/nvim-treesitter",
	'norcalli/nvim-colorizer.lua',
	"mason-org/mason.nvim",
},

-- start up event timing information
{
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

-- language server
  {
     "neovim/nvim-lspconfig",
	 lazy = true,
	 priority = 1000,
  },

  {   
    "itchyny/lightline.vim",
    lazy = false, -- ensure it's loaded on startup
    priority = 1000, -- load before other UI plugins
    init = function()
        -- Set global variables before plugin loads
        vim.g.lightline = {
        colorscheme = 'one',
        active = {
        left = { {'mode' ,'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } }
        }
        }
    end,
    },

-- auto closing pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

-- auto cmd  
 {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    {
      "garymjr/nvim-snippets",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = {
        friendly_snippets = true,
      },
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "snippets" },
      }),
    })
  end,
},

}
