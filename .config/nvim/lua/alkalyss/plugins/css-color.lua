-- Color name highlighting
return {
	'ap/vim-css-color',
	event = 'VeryLazy',
	init = function ()
		vim.g.colorizer_auto_filetype = 'html,css,javascript,python,conf,dosini'
		vim.g.colorizer_disable_bufleave = 1
		vim.g.colorizer_skip_comments = 0
		vim.g.colorizer_colornames = 0
	end
}
