-- Status bar
return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'RRethy/nvim-base16',
	},
	opts = {
		options = {
			theme = "catppuccin",
			-- component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			globalstatus = true
		},
		sections = {
			lualine_c = {
				{
					'filename',
					path = 1,
					color = function(section)
						return {fg = vim.bo.modified and '#56b6c2' or '#abb2bf'}
					end
				}
			},
			lualine_x = {'filetype'},
			lualine_y = {'encoding', 'fileformat'},
			lualine_z = {'progress', 'location'}
		},
		extensions = {
			'neo-tree',
		}
	}
}
