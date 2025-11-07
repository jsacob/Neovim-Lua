require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.99,
      height = 0.99,
      preview_width = 0.65,
    },
    sorting_strategy = "ascending",
    winblend = 0,
    prompt_position = "top",
  },
})

-- 🖤 Set Telescope backgrounds to black
vim.cmd [[
  highlight TelescopeNormal guibg=#000000
  highlight TelescopeBorder guibg=#000000 guifg=#000000
  highlight TelescopePromptNormal guibg=#000000
  highlight TelescopePromptBorder guibg=#000000 guifg=#000000
  highlight TelescopeResultsNormal guibg=#000000
  highlight TelescopeResultsBorder guibg=#000000 guifg=#000000
  highlight TelescopePreviewNormal guibg=#000000
  highlight TelescopePreviewBorder guibg=#000000 guifg=#000000
]]

