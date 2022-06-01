" Plugins =====================================================================erg2/src/

" Install vim-plug if not installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Install plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Visual improvements
Plug 'bling/vim-airline'                            " Status bar
Plug 'vim-airline/vim-airline-themes'               " Status bar themes
Plug 'ap/vim-css-color'
Plug 'luochen1990/rainbow'                          " Bracket colorizer

" Functional improvements
Plug 'sheerun/vim-polyglot'                         " Syntax highlighting
Plug 'tpope/vim-commentary'                         " Comments
Plug 'jiangmiao/auto-pairs'                         " Auto bracket closing
Plug 'tpope/vim-surround'                           " Bracket shortcuts
Plug 'godlygeek/tabular'                            " Align stuff
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'} " LaTeX live preview
Plug 'tpope/vim-fugitive'							" Git integration

Plug 'neoclide/coc.nvim', {'branch': 'release'}		" IntelliSense

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim' 				" Fuzzy finder


" File explorer
Plug 'preservim/nerdtree'                           " Directory explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git integration
Plug 'ryanoasis/vim-devicons'                       " Add file icons

"Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'yunlingz/equinusocio-material.vim'

call plug#end()


" Options ======================================================================

" Enable more colors
if !has('gui_running')
	set t_Co=256
endif

if (has("termguicolors"))
	set termguicolors
endif

let mapleader =","

" Theme
let g:equinusocio_material_style = 'darker'
" let g:equinusocio_material_less = 50
let g:equinusocio_material_bracket_improved = 0
colorscheme equinusocio_material

" Status bar theme
let g:palenight_terminal_italics = 1
let g:airline_theme = 'palenight'

set bg=dark						" Set background for highlighting
set go=P						" Copy visual selection to "+ register
set shortmess=ac				" Short messages
set mouse=a						" Enable mouse

set encoding=utf-8				" Set display encoding to utf-8
set fileencoding=utf-8			" Set file write encoding to utf-8

set nohlsearch					" Don't highlight search
set incsearch					" Enable incremental search
set ignorecase					" Ignore case for search
set smartcase					" If search contains uppercase it becomes case sensitive

set clipboard+=unnamedplus		" Enable "+ register

set number relativenumber		" Relative line numbers
set noshowmode					" Don't show mode (Insert, Visual, Normal)
set noruler						" Don't show cursor position
set laststatus=2				" Disable status line
set noshowcmd					" Don't show last command

" Recently vim can merge signcolumn and number column into one
" for coc
if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

set tabstop=4					" Tab = 4 spaces
set shiftwidth=4				" Number of spaces to autoindent
set noexpandtab					" Tabs are tabs not spaces
set autoindent					" Enable auto indent
set smartindent					" Enable smart indent

set wildmode=longest,list,full	" Enable autocompletion

set splitbelow splitright		" Split below and to the right

set updatetime=300				" Set update time to 300ms
set timeoutlen=500				" Set timeout length to 500ms

filetype plugin indent on		" Enable filetype detection and plugins
syntax on						" Enable syntax highlighting

let g:rainbow_active = 1		" Enable rainbow parenthesis


" Shortcuts ====================================================================

" Split navigation shortcuts:
map <C-n> :vnew<CR>
map <C-s> :new<CR>
map <C-q> <C-w>q

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Don't keep stuff replaced by c
nnoremap c "_c

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Replace ex mode with gq
map Q gq

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map <leader>o :!opout <c-r>%<CR><CR>

" Spell-check set to <leader>s:
map <leader>s :setlocal spell! spelllang=en,el<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>


" Automations ==================================================================

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=cro

" Compile LaTeX documents on save
autocmd BufWritePost *.tex :silent !xelatex --output-directory "%:p:h" "%"

" Cleanup LaTeX build files on exit
autocmd VimLeave *.tex !texclear %

" Set file associations for specific extensions
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.frag set syntax=glsl
autocmd BufRead,BufNewFile *.vert set syntax=glsl

" Delete all trailing whitespace and newlines at end of file on save
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	%s/\n\+\%$//e
	call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %


" NERDTree config ==============================================================

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
	\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" NERDTree file path
let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'

" NERDTree git integration use Nerd Fonts
let g:NERDTreeGitStatusUseNerdFonts = 1

" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>


" Telescope ====================================================================

nnoremap <leader>f <cmd>Telescope find_files<cr>


" Latex live preview config ====================================================

let g:livepreview_previewer = 'zathura' " Pdf viewer
let g:livepreview_use_biber = 1         " Use biber
let g:livepreview_engine = 'xelatex'    " Use xelatex engine

" Open LaTeX pdf preview
map <leader>p :LLPStartPreview<CR>


" Colorizer config =============================================================

" Enable auto color highlighting for these filetypes
let g:colorizer_auto_filetype ='html,css,javascript,python,conf,dosini'
let g:colorizer_disable_bufleave = 1	" Keep color when changing buffer
let g:colorizer_skip_comments = 0		" Skip comments
let g:colorizer_colornames = 0			" Don't highlight color names


" Coc config ===================================================================

let g:coc_global_extensions = [
	\'coc-json', 'coc-git', 'coc-yaml',
	\'coc-pyright', 'coc-clangd', 'coc-texlab',
	\'coc-snippets'
	\]

" Use TAB for expansion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Trigger completion with Ctrl-Space
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Show documentation with K
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Symbol renaming.
nmap <f2> <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <M-o> :CocCommand clangd.switchSourceHeader vsplit<CR>

" Extra ========================================================================

" Enable greek key support
source $HOME/.config/nvim/greek_keys.vim
