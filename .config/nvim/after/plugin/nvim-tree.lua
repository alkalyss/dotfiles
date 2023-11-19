require('nvim-tree').setup {
	view = {
		side = "right",
		width = 45,
	},
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

vim.keymap.set('n', '<leader>t', require('nvim-tree.api').tree.toggle, {desc = "Toggle File[T]ree"})
