local lsp = require('lsp-zero')
local telescope = require('telescope.builtin')

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
	vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
	vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions, opts)

	vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)

	vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, opts)
	vim.keymap.set('n', '<leader>fs', telescope.lsp_document_symbols, opts)
	vim.keymap.set('n', '<leader>gd', telescope.diagnostics, opts)

	vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

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
