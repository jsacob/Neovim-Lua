local M = {}
-- Imported Lsp
require('clang_lsp')
require('lualsp')

function M.setup()
  vim.diagnostic.config({
    virtual_text = true,
    float = { border = "rounded" },
  })

  local cmp = require('cmp')
  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },

    }, mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function()
      end,
    },
  })

require('mason-lspconfig').setup({
    handlers = {
        function(server)
        	vim.lsp.enable()[server].setup({
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })
        end,
	   }
})
end
return M

