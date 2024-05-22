-- Buffer and window closing shortcuts
return {
	'mhinz/vim-sayonara',
	event = 'VeryLazy',
	keys = {
		{'<leader>q', ':Sayonara!<cr>', desc = "[q]uit buffer"},
		{'<leader>Q', ':Sayonara<cr>', desc = "[Q]uit window"}
	}
}
