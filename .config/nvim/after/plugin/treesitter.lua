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
				['af'] = '@function.outer',
				['ic'] = '@class.inner',
				['ac'] = '@class.outer'
			}
		}
	},
}

vim.g.skip_ts_context_commentstring_module = true

require('ts_context_commentstring').setup {
	enable_autocmd = false,
}

require("treesitter-context").setup {
	max_lines = 5,
	separator = "-"
}
