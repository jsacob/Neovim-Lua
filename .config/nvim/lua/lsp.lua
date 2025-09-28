local M = {}

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
      end,
    },
  })

require('mason-lspconfig').setup({
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
end
return M

