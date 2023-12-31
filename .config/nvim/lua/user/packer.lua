local packer = require 'lib.packer-init'

packer.startup(function(use)
	use { 'wbthomason/packer.nvim' } -- Let packer manage itself

	use { 'sheerun/vim-polyglot'} -- Syntax highlighting and filetype recognition
	use { 'tpope/vim-commentary' } -- Easy commenting
	use { 'tpope/vim-surround' } -- Surround text objects with characters
	use { 'tpope/vim-eunuch' } -- Unix helpers
	use { 'tpope/vim-fugitive' } -- Git integration
	use { 'godlygeek/tabular' } -- Allign items
	use { 'jessarcher/vim-heritage' } -- Create missing parent directories when creating a new file
	use { 'sickill/vim-pasta' } -- Context aware pasting
	use { 'ap/vim-css-color' } -- Color name highlighting
	use { 'mhinz/vim-sayonara' } -- Buffer and window closing shortcuts
	use { 'karb94/neoscroll.nvim' } -- Smooth scrolling
	use { 'HiPhish/rainbow-delimiters.nvim' } -- Bracket pair colorizer
	use { "catppuccin/nvim", as = "catppuccin" } -- Color theme
	use { "lewis6991/gitsigns.nvim" } -- Git diff signs and hunk management

	-- Indent guides
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require('ibl').setup()
		end
	}

	-- Telescope - fuzzy finder and other things
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			'nvim-telescope/telescope-live-grep-raw.nvim',
		},
	}

	-- File tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = 'nvim-tree/nvim-web-devicons',
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
			'3rd/image.nvim',
		}
	}

	-- Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			'RRethy/nvim-base16',
		},
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
		}
	}

	-- Autocompletion
	use{
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',

			-- 'onsails/lspkind',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Nvim completion
			'folke/neodev.nvim',
		}
	}

	-- Treesitter - Text object recognition
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'nvim-treesitter/playground',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'nvim-treesitter/nvim-treesitter-context',
		},
	}

	-- Auto bracket pairs
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup{}
		end
	}

	-- DAP - Debugger Adapter Protocol
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap',
			'mfussenegger/nvim-dap-python',
		}
	}

end)
