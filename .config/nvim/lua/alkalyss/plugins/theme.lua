-- Color theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 900,
	init = function ()
		vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
		vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		flavour = "mocha",
		transparent_background = true,
	}
}
