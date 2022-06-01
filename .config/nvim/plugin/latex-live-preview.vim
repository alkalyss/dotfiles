Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'}

let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_engine = 'xelatex'

map <leader>p :LLPStartPreview<cr>
