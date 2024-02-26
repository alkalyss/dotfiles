return {
	'sheerun/vim-polyglot', -- Syntax highlighting and filetype recognition
	'tpope/vim-commentary', -- Easy commenting
	'tpope/vim-surround', -- Surround text objects with characters
	'tpope/vim-eunuch', -- Unix helpers
	'tpope/vim-fugitive', -- Git integration
	'godlygeek/tabular', -- Allign items
	'jessarcher/vim-heritage', -- Create missing parent directories when creating a new file
	'sickill/vim-pasta', -- Context aware pasting

	-- Indent guides
	{
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require('ibl').setup()
		end
	},

	-- Auto bracket pairs
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup{}
		end
	}
}
