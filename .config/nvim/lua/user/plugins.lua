local packer = require 'lib.packer-init'

packer.startup(function(use)
	use { 'wbthomason/packer.nvim' } -- Let packer manage itself

	use { 'sheerun/vim-polyglot' }
	use { 'tpope/vim-commentary' }
	use { 'tpope/vim-surround' }
	use { 'tpope/vim-eunuch' }
	use { 'tpope/vim-fugitive' }
	use { 'godlygeek/tabular' }
	use { 'jessarcher/vim-heritage' }
	use { 'sickill/vim-pasta' }
	use { 'ap/vim-css-color' }
	use { 'luochen1990/rainbow' }
	use { 'xuhdev/vim-latex-live-preview' }
	use { 'mhinz/vim-sayonara' }
	use { 'puremourning/vimspector' }
	use { 'karb94/neoscroll.nvim' }

	use {
		'nvim-lua/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			'nvim-telescope/telescope-live-grep-raw.nvim'
		},
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'RRethy/nvim-base16'
		},
	}

	use {
		'yunlingz/equinusocio-material.vim',
		requires = 'drewtempelmeyer/palenight.vim',
	}

	use {
		'junnplus/lsp-setup.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/nvim-lsp-installer',
			'p00f/clangd_extensions.nvim',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim'
		},
	}

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'onsails/lspkind.nvim',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp-signature-help'
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		requires = {
			'nvim-treesitter/playground',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/playground',
			'lewis6991/spellsitter.nvim',
			'JoosepAlviste/nvim-ts-context-commentstring'
		},
		config = function()
			require('spellsitter').setup()
		end
	}

	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup{}
		end
	}

end)
