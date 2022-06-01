Plug 'drewtempelmeyer/palenight.vim'
Plug 'yunlingz/equinusocio-material.vim'

let g:equinusocio_material_style = 'darker'
" let g:equinusocio_material_less = 50
let g:equinusocio_material_bracket_improved = 0

let g:palenight_terminal_italics = 1
let g:airline_theme = 'palenight'

autocmd User PlugLoaded colorscheme equinusocio_material
