Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nnoremap <silent> K :call <SID>show_documentation()<cr>

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

nnoremap <silent> <M-o> :CocCommand clangd.switchSourceHeader vsplit<cr>
