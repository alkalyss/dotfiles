-- Enable more colors
if vim.fn.has('gui_running') == 0 then
	vim.o.t_Co = 256
end

if vim.fn.has('termguicolors') == 1 then
	vim.opt.termguicolors = true
end

vim.g.mapleader = ' '

vim.opt.bg = 'dark'							-- Set background for highlighting
vim.opt.go = 'P'							-- Copy visual selection to '+ register
vim.opt.shortmess = 'ac'					-- Short messages
vim.opt.mouse = ''							-- Disable mouse
vim.opt.scrolloff = 8						-- Keep the cursor 8 lines from the top/bottom
vim.opt.sidescrolloff = 8					-- Keep the cursor 8 lines from the sides
vim.opt.wrap = false						-- Don't wrap lines

vim.opt.encoding = 'utf-8'					-- Set display encoding to utf-8
vim.opt.fileencoding = 'utf-8'				-- Set file write encoding to utf-8

vim.opt.hlsearch = false					-- Don't highlight search
vim.opt.incsearch = true					-- Enable incremental search
vim.opt.ignorecase = true					-- Ignore case for search
vim.opt.smartcase = true					-- If search contains uppercase it becomes case sensitive

vim.opt.clipboard = 'unnamedplus'			-- Enable system clipboard

vim.opt.number = true						-- Enable line numbers
vim.opt.relativenumber = true				-- Make line numbers relative
vim.opt.showmode = false					-- Don't show mode (Insert, Visual, Normal)
vim.opt.ruler = false						-- Don't show cursor position
vim.opt.showcmd = false						-- Disable status line
vim.opt.laststatus = 2						-- Don't show last command

vim.opt.signcolumn = 'yes'					-- Use signcolumn for git and lsp

vim.opt.tabstop = 4							-- Tab = 4 spaces
vim.opt.shiftwidth = 4						-- Number of spaces to autoindent
vim.opt.expandtab = false					-- TABS ARE TABS
vim.opt.autoindent = true					-- Enable auto indent
vim.opt.smartindent = true					-- Enable smart indent

vim.opt.wildmode = 'longest,list,full'		-- Enable autocompletion

vim.opt.splitbelow = true					-- Split below
vim.opt.splitright = true					-- Split right

vim.opt.updatetime = 300					-- Set update time to 300ms
vim.opt.timeoutlen = 500					-- Set timeout length to 500ms

vim.opt.filetype = 'on'						-- Enable filetype detection and plugins
vim.opt.filetype.indent = 'on'
vim.opt.filetype.plugin = 'on'
vim.opt.syntax = 'on'						-- Enable syntax highlighting
