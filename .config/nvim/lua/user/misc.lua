-- Compile LaTeX documents on save
vim.cmd [[
	autocmd BufWritePost *.tex :silent !tectonic --outdir "%:p:h" "%"
]]

-- Cleanup LaTeX build files on exit
vim.cmd [[
	autocmd VimLeave *.tex !texclear %
]]

-- Set file associations for specific extensions
vim.cmd [[
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufRead,BufNewFile *.fragmentshader set filetype=glsl
	autocmd BufRead,BufNewFile *.vertexshader set filetype=glsl
	autocmd FileType glsl setlocal commentstring=//\ %s
]]

-- Delete all trailing whitespace and newlines at end of file on save
vim.cmd [[
	function StripTrailingWhitespaces()
		let l = line(".")
		let c = col(".")
		%s/\s\+$//e
		%s/\n\+\%$//e
		call cursor(l, c)
	endfun

	autocmd BufWritePre * :call StripTrailingWhitespaces()
]]

-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.cmd [[
	autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
]]

-- Momentarily highlight yanked text
vim.api.nvim_create_autocmd( "TextYankPost", {
	callback = function()
		vim.highlight.on_yank {higroup = "IncSearch", timeout = 200}
	end
})
