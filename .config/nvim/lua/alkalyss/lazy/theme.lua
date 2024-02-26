-- Color theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
		vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
		})

		vim.cmd.colorscheme("catppuccin")
	end
}
