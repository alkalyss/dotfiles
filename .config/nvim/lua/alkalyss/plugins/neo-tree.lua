-- File tree
return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
		'3rd/image.nvim',
	},
	lazy = false,
	priority = 1000,
	opts = {
		window = {
			position = "right",
			mappings = {
				["<space>"] = "none",
			},
		},
		filesystem = {
			group_empty_dirs = false,
			hijack_netrw_behavior = "open_current",
		},
	},
	init = function ()
		vim.keymap.set('n', '<leader>t', function ()
			local reveal_file = vim.fn.expand("%:p")
			if (reveal_file == '') then
				reveal_file = vim.fn.getcwd()
			else
				local f = io.open(reveal_file, "r")
				if (f) then
					f.close(f)
				else
					reveal_file = vim.fn.getcwd()
				end
			end
			require("neo-tree.command").execute({
				toggle = true,
				reveal_file = reveal_file,
				reveal_force_cwd = true,
			})
			end,
			{desc = "Toggle File[T]ree"}
		)
	end
}
