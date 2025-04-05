-- Bracket pair colorizer
return {
	'HiPhish/rainbow-delimiters.nvim',
	main = 'rainbow-delimiters.setup',
	opts = {
		strategy = {
			[''] = function() return require('rainbow-delimiters').strategy['global'] end,
			vim = function() return require('rainbow-delimiters').strategy['local'] end,
		},
		query = {
			[''] = 'rainbow-delimiters',
			lua = 'rainbow-blocks',
		},
		highlight = {
			'RainbowDelimiterYellow',
			'RainbowDelimiterViolet',
			'RainbowDelimiterBlue',
		},
	},
}
