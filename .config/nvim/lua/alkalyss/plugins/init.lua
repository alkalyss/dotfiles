return {
	'sheerun/vim-polyglot', -- Syntax highlighting and filetype recognition
	'tpope/vim-commentary', -- Easy commenting
	{ 'echasnovski/mini.surround', version = '*', opts = {} }, -- Surround text objects with characters
	'tpope/vim-eunuch', -- Unix helpers
	'tpope/vim-fugitive', -- Git integration
	'godlygeek/tabular', -- Allign items
	'jessarcher/vim-heritage', -- Create missing parent directories when creating a new file
	'sickill/vim-pasta', -- Context aware pasting
	-- "github/copilot.vim", -- I think this explains itself

	{ 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} }, -- Indent guides
	{ 'windwp/nvim-autopairs', config = true } -- Auto bracket pairs
}
