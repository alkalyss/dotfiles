return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-telescope/telescope-live-grep-raw.nvim',
	},
	config = function ()
		local telescope = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = "[F]ind [F]ile"})
		vim.keymap.set('n', '<leader>fg', telescope.live_grep, {desc = "[F]ind with [G]rep"})
		vim.keymap.set('n', '<leader>fb', telescope.buffers, {desc = "[F]ind [B]uffers"})
		vim.keymap.set('n', '<leader>fh', telescope.help_tags, {desc = "[F]ind [H]elp file"})
		vim.keymap.set('n', '<leader>fk', telescope.keymaps, {desc = "[F]ind [K]eymaps"})

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
	end
}
