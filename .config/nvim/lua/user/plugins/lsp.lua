local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lua_runtime_path = vim.split(package.path, ";")
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

require('nvim-lsp-setup').setup({
	mappings = {
		gd = 'lua require "telescope.builtin".lsp_definitions()',
		gi = 'lua require "telescope.builtin".lsp_implementations()',
		gr = 'lua require "telescope.builtin".lsp_references()',
	},
	capabilities = capabilities,
	servers = {
		arduino_language_server = {
			cmd = {
				"arduino-language-server",
				"-fqbn", "arduino:avr:uno",
				"-cli", "arduino-cli",
				"-clangd", "clangd"
			}
		},
		bashls = {},
		clangd = {},
		cssls = {},
		html = {},
		jdtls = {},
		jsonls = {},
		ltex = {},
		sumneko_lua = {
			setting = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
						path = lua_runtime_path
					},
					diagnostics = {
						globals = { "vim" }
					},
					workspace = {
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
					telemetry = {
						enable = false
					}
				}
			}
		},
		tsserver = {},
		pyright = {},
	}
})
