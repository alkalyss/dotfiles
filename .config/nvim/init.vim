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
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'}
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
call plug#end()


" Options ======================================================================

let mapleader =","

set number relativenumber		" Relative line numbers
set encoding=utf-8				" Set encoding to utf-8

set bg=light					" Set background for highlighting
set go=P						" Copy visual selection to "+ register
set mouse=a						" Enable mouse

set nohlsearch					" Don't highlight search
set ignorecase					" Ignore case for search
set smartcase					" If search contains uppercase it becomes case sensitive

set clipboard+=unnamedplus		" Enable "+ register

set noshowmode					" Don't show mode (Insert, Visual, Normal)
set noruler						" Don't show cursor position
set laststatus=0				" Disable status line
set noshowcmd					" Don't show last command

set nocompatible				" Blanck
set t_Co=256					" Enable 256 colors

set tabstop=4					" Tab = 4 spaces
set shiftwidth=4				" Number of spaces to autoindent
set noexpandtab					" Tabs are tabs not spaces
set autoindent					" Enable auto indent
set smartindent					" Enable smart indent

set wildmode=longest,list,full	" Enable autocompletion

set splitbelow splitright		" Split below and to the right

set updatetime=300				" Set update time to 300ms

syntax on						" Enable syntax highlighting
filetype plugin on				" Enable filetype detection and plugins

let g:rainbow_active = 1		" Enable rainbow parenthesis

" Latex live preview options
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_engine = 'xelatex'

" NERDTree file path
let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'

" Shortcuts ====================================================================

" Split navigation shortcuts:
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

" Open LaTeX pdf preview
map <leader>p :LLPStartPreview<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>


" Automations ==================================================================

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Compile LaTeX documents on save
autocmd BufWritePost *.tex :silent !xelatex %

" Cleanup LaTeX build files on exit
autocmd VimLeave *.tex !texclear %

" Set file associations for specific extensions
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.frag set syntax=glsl
autocmd BufRead,BufNewFile *.vert set syntax=glsl

" Delete all trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %


" Extra ========================================================================

" Enable greek key support
source $HOME/.config/nvim/greek_keys.vim
