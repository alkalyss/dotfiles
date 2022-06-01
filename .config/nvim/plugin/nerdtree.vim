Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
	\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'

let g:NERDTreeGitStatusUseNerdFonts = 1

map <leader>t :NERDTreeToggle<cr>
