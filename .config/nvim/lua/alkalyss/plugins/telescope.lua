return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-telescope/telescope-ui-select.nvim',
	},
	init = function()
		local telescope = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = "[F]ind [F]ile"})
		vim.keymap.set('n', '<leader>fg', telescope.live_grep, {desc = "[F]ind with [G]rep"})
		vim.keymap.set('n', '<leader>bb', telescope.buffers, {desc = "List [BB]uffers"})
		vim.keymap.set('n', '<leader>fh', telescope.help_tags, {desc = "[F]ind [H]elp file"})
		vim.keymap.set('n', '<leader>fk', telescope.keymaps, {desc = "[F]ind [K]eymaps"})

		vim.keymap.set('n', '<leader>gs', telescope.git_status, {desc = "[G]it [S]tatus"})
		vim.keymap.set('n', '<leader>gb', telescope.git_branches, {desc = "[G]it [B]ranches"})
		vim.keymap.set('n', '<leader>gc', telescope.git_commits, {desc = "[G]it [C]ommits"})

		require('telescope').load_extension('ui-select')
	end,
	opts = {
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
		},
		extensions = {
			["ui-select"] = {
				require('telescope.themes').get_dropdown()
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		}
	},
}
