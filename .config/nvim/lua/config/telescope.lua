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
