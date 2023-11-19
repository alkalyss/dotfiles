local lsp = require('lsp-zero')
local telescope = require('telescope.builtin')

lsp.on_attach(function(client, bufnr)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "Show symbol information", buffer = bufnr, remap = false})

	vim.keymap.set('n', 'gd', telescope.lsp_definitions, {desc = "[G]o to [D]efinition", buffer = bufnr, remap = false})
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "[G]o to [D]eclaration", buffer = bufnr, remap = false})
	vim.keymap.set('n', 'gi', telescope.lsp_implementations, {desc = "[G]o to [I]mplementation", buffer = bufnr, remap = false})
	vim.keymap.set('n', 'gr', telescope.lsp_references, {desc = "[G]o to [R]eferences", buffer = bufnr, remap = false})
	vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions, {desc = "[G]o to [T]ype [D]efinition", buffer = bufnr, remap = false})

	vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {desc = "", buffer = bufnr, remap = false})
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = "Go to previous diagnostic", buffer = bufnr, remap = false})
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = "Go to next diagnostic", buffer = bufnr, remap = false})
	vim.keymap.set('n', '<leader>gd', telescope.diagnostics, {desc = "[G]o to [D]iagnostics", buffer = bufnr, remap = false})

	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {desc = "Rename symbol", buffer = bufnr, remap = false})
	vim.keymap.set('n', '<F3>', vim.lsp.buf.code_action, {desc = "Code actions", buffer = bufnr, remap = false})

	vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, {desc = "Find [W]orkspace [S]ymbols", buffer = bufnr, remap = false})
	vim.keymap.set('n', '<leader>fs', telescope.lsp_document_symbols, {desc = "Find [F]ile [S]ymbols", buffer = bufnr, remap = false})

	vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, {desc = "[G]et [S]ignature help", buffer = bufnr, remap = false})
	vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, {desc = "Get signature [H]elp (Insert mode)", buffer = bufnr, remap = false})
end)

require("neodev").setup({
	library = {
		plugins = {
			"nvim-dap-ui"
		},
		types = true,
	},
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'clangd',
		'cmake',
		'cssls',
		'dockerls',
		'docker_compose_language_service',
		'html',
		'jsonls',
		'ltex',
		'lua_ls',
		'marksman',
		'pyright',
		'tsserver',
	},
	automatic_installation = true,
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})
