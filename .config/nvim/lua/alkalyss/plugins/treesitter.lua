return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'JoosepAlviste/nvim-ts-context-commentstring',
		'nvim-treesitter/nvim-treesitter-context',
	},
	init = function()
		vim.g.skip_ts_context_commentstring_module = true

		require("ts_context_commentstring").setup{
			enable_autocmd = false,
		}
	end,
	main = 'nvim-treesitter.configs',
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},
		auto_install = true,
		indent = {
			enable = false
		},
		highlight = {
			enable = true,
			disable = { 'NvimTree' },
			additional_vim_regex_highlighting = true
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					['ia'] = '@parameter.inner',
					['if'] = '@function.inner',
					['af'] = '@function.outer',
					['ic'] = '@class.inner',
					['ac'] = '@class.outer'
				}
			}
		},
	},
}
