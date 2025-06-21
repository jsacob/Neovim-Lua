

-- Located: .config/nvim/lua/plugins/plug.lua

--[[ 
1. lazy: whether to lazy-load the plugin

2. priority: load order if not lazy-loaded

3. init: function that runs before the plugin is loaded

4. config: function that runs after the plugin is loaded

5. opts: passed to plugins that expose a setup() function (like nvim-lualine or telescope)
]]

return {
	
-- the colorscheme should be available when starting Neovim  
{
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
}, 

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
     "neovim/nvim-lspconfig",
	 lazy = false,
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

--[[ # Needs to be fixed not sure of the issue just don't have the energy right now, not priority.
{
  "iamcco/markdown-preview.nvim",
  lazy = false,
  priority = 1000,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" } 
  end,
  ft = { "markdown" },
},
]]

{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
},

{
    "mason-org/mason.nvim",
    opts = {}
},

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
}

}
