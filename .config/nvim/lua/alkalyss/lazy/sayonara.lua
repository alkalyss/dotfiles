-- Buffer and window closing shortcuts
return {
	'mhinz/vim-sayonara',
	config = function ()
		vim.keymap.set('n', '<leader>q', ':Sayonara!<cr>', {desc = "[q]uit buffer"})
		vim.keymap.set('n', '<leader>Q', ':Sayonara<cr>', {desc = "[Q]uit window"})
	end
}
