require("alkalyss.core.greek_keys")

-- Put result of search on center of screen
vim.keymap.set('', 'n', 'nzzzv')
vim.keymap.set('', 'N', 'Nzzzv')

-- Page up/down with cursor at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Open file even if it's not found
vim.keymap.set('', 'gF', ':edit <cfile><cr>')

-- Move highlighted lines
vim.keymap.set("v", "<DOWN>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<UP>", ":m '<-2<CR>gv=gv")

-- Paste over highlighted area without overriding register
vim.keymap.set("v", "<leader>p", "\"_dP")

-- Delete to the void register
vim.keymap.set({'n', 'v'}, "<leader>d", "\"_d")

-- Don't keep stuff replaced by c
vim.keymap.set('n', 'c', '"_c')

-- Split navigation shortcuts
vim.keymap.set('n', '<C-n>', ':vnew<cr>')
vim.keymap.set('n', '<C-s>', ':new<cr>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Replace all
vim.keymap.set('n', '<leader>ra', ':%s//g<Left><Left>', {desc= "Replace all"})

-- Replace word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc= "Replace word"})

-- Disable Q
vim.keymap.set('', 'Q', '<nop>')

-- Compile document, be it groff/LaTeX/ markdown/etc.
vim.keymap.set('', '<leader>c', ':w! | !compiler "%"<cr>', {desc= "Compile file"})

-- Open corresponding .pdf/.html or preview
vim.keymap.set('', '<leader>o', ':!opout "%"<cr><cr>', {desc= "Open pdf file"})

-- Spell-check
vim.keymap.set('', '<leader>s', ':setlocal spell! spelllang=en,el', {desc= "Spellcheking"})

-- Save file as sudo if it requires root permission
vim.keymap.set('c', 'w!!', 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', {desc= "Save file with sudo priviledges"})

-- Perform dot command over visual blocks
vim.keymap.set('v', '.', ':normal .<cr>')

-- Reload config
vim.keymap.set('n', '<leader><cr>', ':so $HOME/.config/nvim/init.lua<cr>', {desc= "Reload nvim config"})

-- Make file executable
vim.keymap.set('n', '<leader>x', ':silent !chmod +x "%"<cr>', {desc= "Make file executable"})
