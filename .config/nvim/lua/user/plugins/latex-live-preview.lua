local keymap = require 'lib.utils'.keymap

vim.g.livepreview_previewer = 'zathura'
vim.g.livepreview_use_biber = 1
vim.g.livepreview_engine = 'xelatex'

keymap('n', '<leader>p', ':LLPStartPreview<cr>')
