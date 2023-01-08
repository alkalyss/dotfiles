vim.g.equinusocio_material_style = 'darker'
vim.g.equinusocio_material_bracket_improved = 0

vim.cmd [[
	colorscheme equinusocio_material
]]

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
