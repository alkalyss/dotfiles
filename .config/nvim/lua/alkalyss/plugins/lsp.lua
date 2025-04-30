-- LSP
return {
	{
		'williamboman/mason-lspconfig.nvim',
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{
				'williamboman/mason.nvim',
				lazy = false,
				opts = {
					ui = {
						border = "rounded",
					}
				}
			},
			'neovim/nvim-lspconfig',

			-- 'hrsh7th/nvim-cmp',
			"saghen/blink.cmp",

			'Decodetalkers/csharpls-extended-lsp.nvim',
		},
		init = function ()
			local lspconfig = require("lspconfig")

			local lsp_defaults = lspconfig.util.default_config
			-- lsp_defaults.capabilities = vim.tbl_deep_extend(
			-- 	'force',
			-- 	lsp_defaults.capabilities,
			-- 	require('cmp_nvim_lsp').default_capabilities()
			-- )
			lsp_defaults.capabilities = require("blink.cmp").get_lsp_capabilities(lsp_defaults.capabilities)


			local telescope = require('telescope.builtin')

			vim.opt.signcolumn = 'yes'

			vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float({border="rounded"}) end, {desc = "Open floating diagnostic", remap = false})
			vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count=-1, float=true}) end, {desc = "Go to previous diagnostic", remap = false})
			vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count=1, float=true}) end, {desc = "Go to next diagnostic", remap = false})
			vim.keymap.set('n', '<leader>gd', telescope.diagnostics, {desc = "[G]et [D]iagnostics", remap = false})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf

					vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({border="rounded"}) end, {desc = "Show symbol information", buffer = bufnr, remap = false})

					vim.keymap.set('n', 'gd', telescope.lsp_definitions, {desc = "[G]o to [D]efinition", buffer = bufnr, remap = false})
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "[G]o to [D]eclaration", buffer = bufnr, remap = false})
					vim.keymap.set('n', 'gi', telescope.lsp_implementations, {desc = "[G]o to [I]mplementation", buffer = bufnr, remap = false})
					vim.keymap.set('n', 'gr', telescope.lsp_references, {desc = "[G]o to [R]eferences", buffer = bufnr, remap = false})
					vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions, {desc = "[G]o to [T]ype [D]efinition", buffer = bufnr, remap = false})

					vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {desc = "Rename symbol", buffer = bufnr, remap = false})
					vim.keymap.set('n', '<F3>', vim.lsp.buf.code_action, {desc = "Code actions", buffer = bufnr, remap = false})

					vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, {desc = "Find [W]orkspace [S]ymbols", buffer = bufnr, remap = false})
					vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, {desc = "Find [D]ocument [S]ymbols", buffer = bufnr, remap = false})

					vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help({border="rounded"}) end, {desc = "[G]et [S]ignature help", buffer = bufnr, remap = false})
					vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help({border="rounded"}) end, {desc = "Get signature [H]elp (Insert mode)", buffer = bufnr, remap = false})

					vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {desc = "[F]or[M]at code", buffer = bufnr, remap = false})
				end
			})

			lspconfig.ltex_plus.setup{
				settings = {
					language = {
						"en-US",
						"el-GR",
					},
				}
			}

		end,
		opts = {
			ensure_installed = {
				'bashls',
				'clangd',
				'cmake',
				'cssls',
				'dockerls',
				'docker_compose_language_service',
				'html',
				'jsonls',
				'lua_ls',
				'marksman',
				'pyright',
				'ts_ls',
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									telemetry = {
										enable = false
									},
								},
							},
							on_init = function(client)
								local join = vim.fs.joinpath
								local path = client.workspace_folders[1].name

								-- Don't do anything if there is project local config
								if vim.uv.fs_stat(join(path, '.luarc.json'))
									or vim.uv.fs_stat(join(path, '.luarc.jsonc'))
									then
									return
								end

								local nvim_settings = {
									runtime = {
										-- Tell the language server which version of Lua you're using
										version = 'LuaJIT',
									},
									diagnostics = {
										-- Get the language server to recognize the `vim` global
										globals = {'vim'}
									},
									workspace = {
										checkThirdParty = false,
										library = {
											-- Make the server aware of Neovim runtime files
											vim.env.VIMRUNTIME,
											vim.fn.stdpath('config'),
										},
									},
								}

								client.config.settings.Lua = vim.tbl_deep_extend(
									'force',
									client.config.settings.Lua,
									nvim_settings
									)
							end,
						})
				end,
				ltex = function ()
					require("lspconfig").ltex.setup{
						settings = {
							language = {
								"en-US",
								"el-GR",
							},
						}
					}
				end,
				csharp_ls = function ()
					require("lspconfig").csharp_ls.setup{
						handlers = {
							["textDocument/definition"] = require("csharpls_extended").handler,
							["textDocument/typeDefinition"] = require("csharpls_extended").handler,
						},
					}
				end
			},
		}
	}
}
