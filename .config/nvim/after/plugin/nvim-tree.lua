local keymap = require ('lib.utils').keymap

require('nvim-tree').setup {
	git = {
		ignore = false,
	},
	reload_on_bufenter = true,
	renderer = {
		indent_markers = {
			enable = true
		}
	}
}

keymap('n', '<leader>t', ':NvimTreeFindFileToggle<cr>')
