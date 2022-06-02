Plug 'puremourning/vimspector'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools']

nnoremap <Leader>dd :call vimspector#Launch()<cr>
nnoremap <Leader>de :call vimspector#Reset()<cr>
nnoremap <Leader>dc :call vimspector#Continue()<cr>

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<cr>
nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<cr>

nnoremap <Leader>da :call vimspector#RunToCursor()<cr>

nmap <Leader>dk <Plug>VimspectorRestart()<cr>
nmap <Leader>dh <Plug>VimspectorStepOut()<cr>
nmap <Leader>dl <Plug>VimspectorStepInto()<cr>
nmap <Leader>dj <Plug>VimspectorStepOver()<cr>
