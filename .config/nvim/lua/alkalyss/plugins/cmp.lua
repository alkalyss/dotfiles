-- Autocompletion
return {
	{
		'folke/neodev.nvim',
		opts = {
			library = {
				plugins = {
					"nvim-dap-ui"
				},
				types = true,
			},
		}
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'SergioRibera/cmp-dotenv',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Nvim completion
			'folke/neodev.nvim',
		},
		config = function ()
			local cmp = require('cmp')

			cmp.setup {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer", keyword_length = 5 },
					{ name = "env" }
				},
				mapping = cmp.mapping.preset.insert({
						['<C-f>'] = cmp.mapping.scroll_docs(-4),
						['<C-b>'] = cmp.mapping.scroll_docs(4),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Replace,
							select = false
						},
						-- ['<Tab>'] = cmp.mapping(
						-- 	function(fallback)
						-- 		if cmp.visible() then
						-- 			cmp.select_next_item()
						-- 		else
						-- 			fallback()
						-- 		end
						-- 	end,
						-- 	{ 'i', 's' }
						-- ),
						-- ['<S-Tab>'] = cmp.mapping(
						-- 	function(fallback)
						-- 		if cmp.visible() then
						-- 			cmp.select_prev_item()
						-- 		else
						-- 			fallback()
						-- 		end
						-- 	end,
						-- 	{ 'i', 's' }
						-- )
					})
			}
		end
	}
}
