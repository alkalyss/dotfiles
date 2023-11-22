vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
	hijack_cursor = true,
	view = {
		side = "right",
		width = 45,
	},
	reload_on_bufenter = true,
	renderer = {
		group_empty = true,
		highlight_git = true,
		highlight_diagnostics = true,
		indent_markers = {
			enable = true,
		}
	},
	filters = {
		dotfiles = true,
		git_ignored = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		}
	}
}

vim.keymap.set('n', '<leader>t', require('nvim-tree.api').tree.toggle, {desc = "Toggle File[T]ree"})
