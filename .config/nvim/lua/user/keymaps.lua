local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '

-- Put result of search on center of screen
keymap('', 'n', 'nzzzv')
keymap('', 'N', 'Nzzzv')

-- Don't keep stuff replaced by c
keymap('n', 'c', '"_c')

-- Open file even if it's not found
keymap('', 'gf', ':edit <cfile><cr>')

-- Split navigation shortcuts
keymap('', '<C-n>', ':vnew<cr>')
keymap('', '<C-s>', ':new<cr>')

keymap('', '<C-h>', '<C-w>h')
keymap('', '<C-j>', '<C-w>j')
keymap('', '<C-k>', '<C-w>k')
keymap('', '<C-l>', '<C-w>l')

-- Replace all
keymap('n', '<leader>r', '%s//g<Left><Left>')

-- Replace ex mode with gq
keymap('', 'Q', 'gq')

-- Compile document, be it groff/LaTeX/ markdown/etc.
keymap('', '<leader>c', ':w! | !compiler "<c-r>%"<cr>')

-- Open corresponding .pdf/.html or preview
keymap('', '<leader>o', ':!opout <cr>%<cr><cr>')

-- Spell-check
keymap('', '<leader>s', ':setlocal spell! spelllang=en,el')

-- Save file as sudo if it requires root permission
keymap('c', 'w!!', 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!')

-- Perform dot command over visual blocks
keymap('v', '.', ':normal .<cr>')

-- Reload config
keymap('n', '<leader><cr>', ':so $HOME/.config/nvim/init.lua<cr>')

-- Make file executable
keymap('n', '<leader>x', ':silent !chmod +x "%"<cr>')
