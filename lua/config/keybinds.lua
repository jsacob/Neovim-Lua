-- Located: .config/nvim/lua/config/keybind.lua 
-- Basic Keybinds
-- Leader Key is set in .config/nvim/lua/config/lazy.lua

-- Write 
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap=true, silent=true})
-- Write And Exit
vim.keymap.set('n', '<leader>q', ':x<CR>', {noremap=true, silent=true})
-- Exit No Write
vim.keymap.set('n', '<leader>x', ':q!<CR>', {noremap=true, silent=true})
-- Find & Replace
vim.keymap.set('n', '<leader>f', ':%s/', {noremap = true})
-- File Explorer
vim.keymap.set('n', '<leader>e', ':Explore<CR>', {noremap=true})

-- Terminal Options
vim.keymap.set('n', '<leader>t', ':belowright term<CR>', {noremap=true})
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "",
	callback = function()
		vim.cmd("startinsert")
	end
	})
local keymap = vim.keymap
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("n", "<leader>j", ":wincmd j<CR>", { silent = true })
keymap.set("n", "<leader>k", ":wincmd k<CR>", { silent = true })
keymap.set("n", "<Space>", "<Nop>", { silent = true })
