local keymap = require 'lib.utils'.keymap

vim.g.vimspector_install_gadgets = {'debugpy', 'vscode-cpptools'}

keymap('n', '<Leader>dd', ':call vimspector#Launch()<cr>')
keymap('n', '<Leader>de', ':call vimspector#Reset()<cr>')
keymap('n', '<Leader>dc', ':call vimspector#Continue()<cr>')

keymap('n', '<Leader>db', ':call vimspector#ToggleBreakpoint()<cr>')
keymap('n', '<Leader>dB', ':call vimspector#ClearBreakpoint()<cr>')

keymap('n', '<Leader>da', ':call vimspector#RunToCursor()<cr>')

keymap('n', '<Leader>dk', '<Plug>VimspectorRestart()<cr>')
keymap('n', '<Leader>dh', '<Plug>VimspectorStepOut()<cr>')
keymap('n', '<Leader>dl', '<Plug>VimspectorStepInto()<cr>')
keymap('n', '<Leader>dj', '<Plug>VimspectorStepOver()<cr>')
