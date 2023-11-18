require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
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
				['af'] = '@function.inner',
				['ic'] = '@class.inner',
				['ac'] = '@class.inner'
			}
		}
	},
	context_commentstring = {
		enable = true
	}
}
