local packer = require 'lib.packer-init'

packer.startup(function(use)
	use { 'wbthomason/packer.nvim' } -- Let packer manage itself

	use { 'sheerun/vim-polyglot' }
	use { 'tpope/vim-commentary' }
	use { 'tpope/vim-surround' }
	use { 'tpope/vim-eunuch' }
	use { 'tpope/vim-fugitive' }
	use { 'godlygeek/tabular' }
	use { 'jiangmiao/auto-pairs' }
	use { 'jessarcher/vim-heritage' }
	use { 'sickill/vim-pasta' }

	use {
		'ap/vim-css-color',
		config = function()
			require('user.plugins.css-color')
		end
	}

	use {
		'luochen1990/rainbow',
		config = function()
			require('user.plugins.rainbow')
		end
	}

	use {
		'xuhdev/vim-latex-live-preview',
		config = function()
			require('user.plugins.latex-live-preview')
		end
	}

	use {
		'mhinz/vim-sayonara',
		config = function()
			require('user.plugins.sayonara')
		end
	}

	use {
		'puremourning/vimspector',
		config = function()
			require('user.plugins.vimspector')
		end
	}

	use {
		'nvim-lua/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			'nvim-telescope/telescope-live-grep-raw.nvim'
		},
		config = function()
			require('user.plugins.telescope')
		end
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('user.plugins.nvim-tree')
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'RRethy/nvim-base16'
		},
		config = function()
			require('user.plugins.lualine')
		end
	}

	use {
		'yunlingz/equinusocio-material.vim',
		requires = 'drewtempelmeyer/palenight.vim',
		config = function()
			require('user.plugins.theme')
		end
	}

	use {
		'karb94/neoscroll.nvim',
		config = function()
			require('user.plugins.neoscroll')
		end
	}

	use {
		'junnplus/nvim-lsp-setup',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/nvim-lsp-installer',
		},
		config = function()
			require('user.plugins.lsp')
		end
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
		config = function()
			require('user.plugins.cmp')
		end
	}
end)
