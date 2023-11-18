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

vim.keymap.set('n', '<leader>t', ':NvimTreeFindFileToggle<cr>')
