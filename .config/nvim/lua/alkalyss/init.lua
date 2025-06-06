local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
end
vim.opt.rtp:prepend(lazypath)

require("alkalyss.core.options")

require("lazy").setup({
	spec = "alkalyss.plugins",
	change_detection = { notify = false },
	checker = {
		enabled = true,
		notify = false,
	},
	install = {
		colorscheme = { "catppuccin" }
	},
	ui = {
		border = "rounded",
	}
})

require("alkalyss.core.keymaps")
require("alkalyss.core.automations")
