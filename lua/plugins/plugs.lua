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

{
  "iamcco/markdown-preview.nvim",
  lazy = false,
  priority = 1000,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" } 
	vim.g.mkdp_browser = '/usr/bin/firefox'
  end,
  ft = { "markdown" },
},

}
