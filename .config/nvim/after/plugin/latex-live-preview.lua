vim.g.livepreview_previewer = 'zathura'
vim.g.livepreview_use_biber = 1
vim.g.livepreview_engine = 'xelatex'

vim.keymap.set('n', '<leader>lp', ':LLPStartPreview<cr>', {desc = "Start [L]atex Live [P]review"})
