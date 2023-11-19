local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>b', telescope.buffers)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)

require('telescope').setup{
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<C-D>"] = "delete_buffer",
				},
				n = {
					["<C-D>"] = "delete_buffer",
				},
			}
		}
	}
}
