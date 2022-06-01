" Options ======================================================================

" Enable more colors
if !has('gui_running')
	set t_Co=256
endif

if (has("termguicolors"))
	set termguicolors
endif

let mapleader =" "

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

set signcolumn=yes 				" Use signcolumn for git and lsp

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



" Shortcuts ====================================================================

map gf :edit <cfile><cr>

" Split navigation shortcuts:
map <silent> <C-n> :vnew<cr>
map <silent> <C-s> :new<cr>
map <silent> <C-q> <C-w>q

map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" Don't keep stuff replaced by c
nnoremap c "_c

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Replace ex mode with gq
map Q gq

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<cr>

" Open corresponding .pdf/.html or preview
map <leader>o :!opout <c-r>%<cr><cr>

" Spell-check set to <leader>s:
map <leader>s :setlocal spell! spelllang=en,el<cr>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Perform dot commands over visual blocks:
vnoremap . :normal .<cr>


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


" Plugins =====================================================================

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
source ~/.config/nvim/plugin/airline.vim
source ~/.config/nvim/plugin/css-color.vim
source ~/.config/nvim/plugin/rainbow.vim

" Functional improvements
source ~/.config/nvim/plugin/polyglot.vim
source ~/.config/nvim/plugin/commentary.vim
source ~/.config/nvim/plugin/auto-pairs.vim
source ~/.config/nvim/plugin/surround.vim
source ~/.config/nvim/plugin/tabular.vim
source ~/.config/nvim/plugin/latex-live-preview.vim
source ~/.config/nvim/plugin/fugitive.vim

" IntelliSense
source ~/.config/nvim/plugin/coc.vim

" Fuzzy finder
source ~/.config/nvim/plugin/telescope.vim

" File explorer
source ~/.config/nvim/plugin/devicons.vim
source ~/.config/nvim/plugin/nerdtree.vim

" Colorschemes
source ~/.config/nvim/plugin/theme.vim

call plug#end()

colorscheme equinusocio_material


" Extra ========================================================================

" Enable greek key support
source $HOME/.config/nvim/greek_keys.vim
