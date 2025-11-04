local M = {}

function M.setup()
  -- Diagnostic configuration
  vim.diagnostic.config({
    virtual_text = true,
    float = { border = "rounded" },
  })

  -- Autocompletion setup (nvim-cmp)
  local cmp = require('cmp')
  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
  })

  -- Mason-LSPconfig setup to ensure servers are installed
  require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "lua_ls" },
    automatic_installation = true,
    experimental = {
      ghost_text = true, -- Enables ghost text (preview of completion)
    },
    handlers = {
      -- Default handler to set up LSP servers
      function(server)
        require('lspconfig')[server].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
    }
  })
end

return M
