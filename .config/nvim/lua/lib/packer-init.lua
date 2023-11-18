local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

local packer = require 'packer'

packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float {border = 'rounded'}
		end,
	}
}

packer.set_handler('config', function(_, plugin, value)
	if type(value) == 'string' and vim.fn.filereadable(vim.fn.expand(value)) == 1 then
		plugin.config = "vim.cmd('source'" .. value .. "')"
	end
end)

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]]

return packer
