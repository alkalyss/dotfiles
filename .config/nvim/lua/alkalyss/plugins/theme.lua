-- Color theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 900,
	init = function ()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true
		}
	}
}
