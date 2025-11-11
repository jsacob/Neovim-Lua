-- lua/plugins/toggleterm.lua
-- Simple floating terminal configuration with black background

require("toggleterm").setup({
  -- Always use floating terminal
  direction = "float",
  open_mapping = [[<C-q>]],

  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,

  shade_terminals = false,
  persist_size = false,
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true,

  float_opts = {
    border = "curved",
    width = function()
      return math.floor(vim.o.columns * 0.9)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.85)
    end,
    winblend = 3,
    title_pos = "center",
  },

  highlights = {
    -- Normal = { guibg = "black" },
    -- NormalFloat = { guibg = "black" },
    -- FloatBorder = { guifg = "#f8f0e7", guibg = "black" },
  },
})

-- Optional: ensure any terminal buffer keeps black background
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    vim.cmd([[
      setlocal winhighlight=Normal:NormalTerm,NormalNC:NormalTerm
      highlight NormalTerm guibg=black
    ]])
  end,
})
