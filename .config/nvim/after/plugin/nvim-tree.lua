local keymap = require ('lib.utils').keymap

require('nvim-tree').setup {
	git = {
		ignore = false,
	},
	reload_on_bufenter = true,
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		}
	},
	filters = {
		dotfiles = true,
	},
}

keymap('n', '<leader>t', ':NvimTreeFindFileToggle<cr>')
