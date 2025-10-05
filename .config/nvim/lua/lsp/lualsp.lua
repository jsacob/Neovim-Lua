vim.lsp.enable('luals',({
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = { library = { vim.env.VIMRUNTIME } }
		}
	},
}))
