local M = {}

pcall(require, 'clang_lsp')
pcall(require, 'lualsp')

function M.setup()
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
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) 
      end,
    },
  })

  require('mason-lspconfig').setup({
    experimental = {
      ghost_text = true,
    },
    handlers = {
      function(server)
        require('lspconfig')[server].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
    }
  })
end

return M

